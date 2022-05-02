<?php

namespace App\Http\Controllers;

use App\Models\Rezervacija;
use App\Models\Soba;
use Illuminate\Http\Request;

class RezervacijaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Rezervacija::all(); //Model get all
        return $data;
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = Rezervacija::create($request->all());
        return $data;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
//        $data = Rezervacija::findOrFail($id);

//        $data = Rezervacija::with('sobe')->where('id',$id)->get();
//        foreach($dataNativ as $rezervacija){
//
//            $sobaDetail = \DB::select(\DB::raw("SELECT soba.id, soba.broj, sprat.naziv as sprat, tip_sobe.naziv as tip_sobe FROM soba
//JOIN sprat on (sprat.id = soba.sprat_id)
//JOIN tip_sobe on (tip_sobe.id = soba.tip_sobe_id)
//WHERE soba.id = ".$rezervacija->soba_id.'  ;'));
//
//            $rezervacija->push($sobaDetail->first());
//        }

        $dataNativ = \DB::select(\DB::raw("SELECT rezervacija.id, datum_od, datum_do, soba.id as soba_id, soba.broj, sprat.naziv as sprat, tip_sobe.naziv as tip_sobe FROM rezervacija 
JOIN soba on (soba.id = rezervacija.soba_id)
JOIN sprat on (sprat.id = soba.sprat_id)
JOIN tip_sobe on (tip_sobe.id = soba.tip_sobe_id)
where rezervacija.id = ".$id.'  ;'));

        $sobaDetail = Soba::with('spratovi','tipSoba')->find($dataNativ[0]->soba_id);

        $dataNativ[0]->test = $sobaDetail;

        return $dataNativ[0];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $rezervacija = Rezervacija::find($id);
        $rezervacija->update($request->all()); //model update
        return $rezervacija;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $rezervacija = Rezervacija::findOrFail($id);
        $rezervacija->delete($id);
        return'{"success":"Uspjesno ste pobirisali popust."}';
    }
}
