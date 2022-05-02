<?php

namespace App\Http\Controllers;

use App\Models\Soba;
use Illuminate\Http\Request;

class SobaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //TODO: native query upit
//        $data = \DB::select("SELECT soba.id, soba.broj, sprat.naziv as sprat, tip_sobe.naziv as tip_sobe FROM soba
//JOIN sprat on (sprat.id = soba.sprat_id)
//JOIN tip_sobe on (tip_sobe.id = soba.tip_sobe_id);");

        //TODO: ovo je test iz jednog upita parametre u drugi
//        $result = \DB::select("SELECT soba.id, soba.broj, sprat.naziv as sprat, tip_sobe.naziv as tip_sobe FROM soba
//JOIN sprat on (sprat.id = soba.sprat_id)
//JOIN tip_sobe on (tip_sobe.id = soba.tip_sobe_id) where sprat.id = 1 and soba.id != ".$data[0]->id);


        $data = Soba::with('spratovi','tipSoba')->get(); //Model get all
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
        $data = Soba::create($request->all());
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
        $data = Soba::findOrFail($id);
        return $data;
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
        $soba = Soba::find($id);
        $soba->update($request->all()); //model update
        return $soba;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $soba = Soba::findOrFail($id);
        $soba->delete($id);
        return'{"success":"Uspjesno ste pobirisali popust."}';
    }
}
