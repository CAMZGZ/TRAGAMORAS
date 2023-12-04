@extends('adminlte::page')

@section('title', 'Añadir Saldo')

@section('content_header')

@stop

@section('content')
<div class="card">
    <div class="card">
        <div class="card-header">
            <h4><i>Añadir Saldo</i></h4>
            <div class="row g-3">
                <div class="col-md-6">
                    <font size=5> <b>{{$tarjeta->nombre}} </b></font><font size=4>({{$tarjeta->id}})</font>
    
                </div>
                
            </div>
            

        </div>

        <div class="card-body">

            <form  method="POST" action="{{route('tarjeta.update', $tarjeta->id)}}">
                @method('PUT')
                @csrf
                <div class="row g-3">
                    <p class="text-center"><font size=5> <b>Monto a agregar</b></font></p>
                    <div class="text-center">
                        <img src="/vendor/img/ffe720d00f857ec7a4a6778a50b18855.jpg" alt="" width="200">
                    </div>
                    <div class="input-group mb-3 col-md-3">
                        <span class="input-group-text" id="creditos">$</span>

                        <input type="number" class="form-control" name="creditos" id="creditos">
        
                    </div>

                    <div class="col-md-3">
                        <input type="text" class="form-control" name="id" name="id" value="{{$tarjeta->id}}" hidden>
        
                    </div>
                    
                </div>
                <div class="text-center" style="-ms-scroll-limit-y-max: 10ch">
                    <button type="submit" class="btn btn-success">                        <img src="http://127.0.0.1:8000/vendor/img/hutao-money-rain.gif" alt="">
                        <br> Agregar
                    </button>
                </div>
            </form>
        </div>
        
    </div>
</div>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop   
