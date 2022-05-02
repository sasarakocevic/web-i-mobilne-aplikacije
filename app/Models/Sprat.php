<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sprat extends Model
{
    use HasFactory;

    public $table = "sprat";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'naziv',
    ];

    public $timestamps = false;
}
