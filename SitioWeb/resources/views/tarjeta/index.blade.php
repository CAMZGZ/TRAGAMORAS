@extends('adminlte::page')

@section('title', 'Tarjetas')

@section('content_header')

@section('plugins.Datatables', true)

@stop

@section('content')
<br>
    <div class="card">

        <div class="card-header">
            <b><h1>Tarjetas</h1></b>
        </div>
        <div class="card-body">
            <table id="T" class="table table-bordered table-light table-striped table-responsive-lg">
                <thead class="table">
                    <tr>
                        <th>#Tarjeta</th>
                        <th> Nombre </th>
                        <th> Monto </th>
                        <th> Opciones </th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($tarjetas as $t)
                    <tr>
                        <td> {{$t->id}} </td>
                        <td> {{$t->nombre}} </td>
                        <td> {{ $t->creditos }}</td>
                        <td>
                            <div class="text-center">
                                <div style="display: inline-block; margin-top: 0px;">
                                    <a class="btn btn-success" 
                                    href="{{route('tarjeta.edit', $t->id)}}" role="button" onclick=""
                                    data-toggle="tooltip" title="Agregar Dinero" >
                                    <i class="bi bi-cash-coin"></i>
                                </a>

                                </div>
                                <div style="display: inline-block; margin-top: 0px;">
                                    <form method="POST" action="{{ route('tarjeta.retirar', $t->id) }}">
                                        @csrf
                                        <input type="text" class="form-control" name="id" name="id" value="{{$t->id}}" hidden>
                                        <button id="reactivate" class="btn btn-danger" type="submit" role="button"
                                            data-toggle="tooltip" title="Retirar Fondos" > 
                                            <i class="bi bi-receipt"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            

                    </tr>
                    @empty
                    <tr>
                        <td>¡</td></td>
                        <td>NO</td>
                        <td>INFORMACION</td>
                        <td>!</td>
                    </tr>  
                    @endforelse
                
                </tbody>
            </table>
        </div>

    </div>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
    <script>
        $(document).ready(function() {
            $('#T').DataTable({
                "language": {
                "lengthMenu": "Mostrar _MENU_ registros por página",
                "zeroRecords": "Nothing found - sorry",
                "info": "Página _PAGE_ de _PAGES_",
                "infoEmpty": "No records available",
                "infoFiltered": "(filtered from _MAX_ total records)",
                "search": "Buscar",
                "paginate": {
                    "previous": "Anterior",
                    "next": "Siguiente",
                    "first": "Primero",
                    "last": "Ultimo"
                }
                },
                "autoWidth": false,
                "responsive": true,
                
            });
            });

    </script>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

    </script>
@stop   

