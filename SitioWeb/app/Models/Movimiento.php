<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\TipoMovimiento;
use App\Models\Tarjeta;

class Movimiento extends Model
{
    use HasFactory;

    public function tipo_movimiento (): BelongsTo
    {
        return $this->belongsTo(TipoMovimiento::class, 'tipo_movimiento_id');
    }

    public function tarjeta (): BelongsTo
    {
        return $this->belongsTo(Tarjeta::class);
    }
}
