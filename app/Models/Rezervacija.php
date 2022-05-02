<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rezervacija extends Model
{
    use HasFactory;

    public $table = "rezervacija";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'datum_od','datum_do','soba_id','kontakt'
    ];

    public $timestamps = false;

    public function sobe()
    {
        return $this->belongsTo(Soba::class, 'soba_id');
    }
}
