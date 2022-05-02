<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Soba extends Model
{
    use HasFactory;

    public $table = "soba";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'broj','tip_sobe_id','sprat_id',
    ];

    public $timestamps = false;

    public function spratovi()
    {
        return $this->belongsTo(Sprat::class, 'sprat_id');
    }

    public function tipSoba()
    {
        return $this->belongsTo(TipSobe::class, 'tip_sobe_id');
    }
}
