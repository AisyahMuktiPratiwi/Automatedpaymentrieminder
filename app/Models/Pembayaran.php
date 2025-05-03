<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pembayaran extends Model
{
    //
    protected $fillable = ['pelanggan_id', 'bulan', 'status_pembayaran', 'tanggal_pembayaran', 'bukti_bayar'];

    public function pelanggan()
    {
        return $this->belongsTo(Pelanggan::class);
    }

}
