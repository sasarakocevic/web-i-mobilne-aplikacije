<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Popust extends Model
{
    use HasFactory;

    public $table = "popust";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'cijena','datum','soba_id'
    ];

    public $timestamps = false;
}
