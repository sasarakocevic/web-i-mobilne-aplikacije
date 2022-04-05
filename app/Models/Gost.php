<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gost extends Model
{
    use HasFactory;

    public $table = "gost";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ime','prezime','email','datum_rodjenja','drzava_id'
    ];

    public $timestamps = false;

    /**
     * Drzava
     *
     * Get All drzave uploaded by gost
     *
     * @return object Eloquent product object
     */
    public function drzave()
    {
        return $this->belongsTo(Drzava::class, 'drzava_id');
    }
}
