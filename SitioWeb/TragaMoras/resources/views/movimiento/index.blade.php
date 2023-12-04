@extends('adminlte::page')

@section('title', 'Movimientos')

@section('content_header')

    
@stop
@section('plugins.Datatables', true)

@section('content')
<br>
    <div class="card">

        <div class="card-header">
            <b><h2>Movimientos</h1></b>
        </div>
        <div class="card-body">
            <table id="TM" class="table table-bordered table-light table-striped table-responsive-lg">
                <thead class="table">
                    <tr>
                        <th>Tarjeta</th>
                        <th>No Tarjeta</th>

                        <th>Movimiento</th>
                        <th>Fecha</th>
                        <th>Monto </th>
                    </tr>
                </thead>
                <tbody>

                    @forelse ($movimientos as $m)
                    
                    <tr 
                    @if ($m->tipo_movimiento_id === 1 || $m->tipo_movimiento_id === 3)
                        class="table-success"
                    @else
                        class="table-danger"
                    @endif
                    >
                        <td> {{$m->tarjeta->nombre}} </td>
                        <td> {{$m->tarjeta->id}}</td>
                        <td> {{$m->tipo_movimiento->nombre}} </td>
                        <td> {{$m->created_at}}</td>
                        <td > {{$m->monto}}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">¡No información!</td>
                    </tr>  
                    @endforelse
                
                </tbody>
                    <tfoot class="text-right">
                        <tr>
                            <td colspan="5" class="text-right">
                                <b>Ganancia Final del día</b><k>{{number_format(($sp - $sm), 2)}}</k>

                            </td>
                        </tr>

                    </tfoot>
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
            $('#TM').DataTable({
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
@stop   

