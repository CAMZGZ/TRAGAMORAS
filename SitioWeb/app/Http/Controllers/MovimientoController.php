<?php

namespace App\Http\Controllers;

use App\Models\Movimiento;
use App\Models\TipoMovimiento;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class MovimientoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        //$movimientos = Movimiento::where('created_at', Carbon::now())->get();
        $movimientos= Movimiento::all();
        $mmenos = Movimiento::where('tipo_movimiento_id', '4')->orWhere('tipo_movimiento_id', '2')->get();
        $sm = $mmenos->sum('monto');
        $mmas = Movimiento::where('tipo_movimiento_id', '1')->orWhere('tipo_movimiento_id', '3')->get();
        $sp=$mmas->sum('monto');
        return view('movimiento.index', compact('movimientos', 'sm', 'sp'));
        
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
    public function show(Movimiento $movimiento)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Movimiento $movimiento)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Movimiento $movimiento)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Movimiento $movimiento)
    {
        //
    }
}
