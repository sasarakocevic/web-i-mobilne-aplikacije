<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slika extends Model
{
    use HasFactory;

    public $table = "slika";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'putanja','soba_id',
    ];

    public $timestamps = false;
}
