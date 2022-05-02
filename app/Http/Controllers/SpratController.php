<?php

namespace App\Http\Controllers;

use App\Models\Sprat;
use Illuminate\Http\Request;

class SpratController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Sprat::all(); //Model get all
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
        $data = Sprat::create($request->all());
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
        $data = Sprat::findOrFail($id);
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
        $sprat = Sprat::find($id);
        $sprat->update($request->all()); //model update
        return $sprat;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $sprat = Sprat::findOrFail($id);
        $sprat->delete($id);
        return'{"success":"Uspjesno ste pobirisali popust."}';
    }
}
