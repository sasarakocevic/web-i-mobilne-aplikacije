<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipSobe extends Model
{
    use HasFactory;

    public $table = "tip_sobe";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'naziv','cijena'
    ];

    public $timestamps = false;
}
