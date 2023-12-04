<?php

namespace App\Http\Controllers;

use App\Models\Movimiento;
use App\Models\Tarjeta;
use Illuminate\Http\Request;

class TarjetaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $tarjetas = Tarjeta::all();

        return view('tarjeta.index', compact('tarjetas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Tarjeta $tarjeta)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit( $request)
    {
        //
        $tarjeta=Tarjeta::where('id', $request)->first();
        return view('tarjeta.edit', compact('tarjeta'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Tarjeta $tarjeta, Request $request)
    {
        $tarjeta = Tarjeta::find($request->id);
        $tarjeta->creditos =$tarjeta->creditos + $request->creditos;

        $tarjeta->save();

        $movimiento= new Movimiento();
        $movimiento->tipo_movimiento_id = '3';
        $movimiento->tarjeta_id = $tarjeta->id;
        $movimiento->monto = $request->creditos;
        $movimiento->save();
        return redirect()->route('tarjeta.index');
    }
    

    public function retirar (Tarjeta $tarjeta, Request $request)
    {
        $tarjeta = Tarjeta::find($request->id);


        $movimiento=new Movimiento();
        $movimiento->tarjeta_id = $request->id;
        $movimiento->monto = $tarjeta->creditos;
        $movimiento->tipo_movimiento_id = 4;
        $movimiento->save();

        $tarjeta->creditos ='0';
        $tarjeta->save();

        return redirect()->route('tarjeta.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Tarjeta $tarjeta)
    {
        //
    }
}
