<?php

namespace App\Http\Controllers;

use App\Models\Drzava;
use Illuminate\Http\Request;

class DrzavaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
//        return \DB::select("select * from drzava"); //nativequery get all
        $data = Drzava::all(); //Model get all
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
        $data = Drzava::create($request->all());
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
        $data = Drzava::findOrFail($id);
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
//        $drzave = $request->all();
//        $affected = \DB::table('drzava')  //nativequery update
//            ->where('id', $id)
//            ->update(['naziv' => $drzave['naziv']]);

        $drzava = Drzava::find($id);
        $drzava->update($request->all()); //model update
        return $drzava;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $drzava = Drzava::findOrFail($id);
        $drzava->delete($id);
        return'{"success":"Uspjesno ste pobirisali drzavu."}';
    }
}
