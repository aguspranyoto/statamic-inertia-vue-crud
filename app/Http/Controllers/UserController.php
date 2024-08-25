<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Statamic\Facades\Collection;
use Statamic\Facades\Entry;
use Illuminate\Support\Str;


class UserController extends Controller
{
    public function index () {
        // Fetch entries from the 'users' collection
        $users = Collection::find('users')->queryEntries()->get();

        // Pass the users data to the Inertia view
        return Inertia::render('Home', [
            'users' => $users
        ]);
    }
    
    public function create () {
        return Inertia::render('CreateUser');
    }

    public function store(Request $request) 
    {
        $validated = $request->validate([
            'title' => ['required', 'string', 'max:255'],
            'content' => ['nullable', 'string'],
        ]);
    
        $slug = Str::slug($validated['title']);
    
        $entry = Entry::make()
            ->collection('users')
            ->slug($slug);
    
        $entry->set('title', $validated['title']);
        $entry->set('content', $validated['content']);
    
        if (Auth::check()) {
            $currentUser = Auth::user();
            $entry->set('updated_by', $currentUser->id);
        }
    
        $entry->save();
    
        return redirect()->route('home')->with('message', 'User created successfully!');
    }

    public function edit($id)
    {
        $entry = Entry::find($id);

        if (!$entry) {
            return redirect()->route('home')->with('error', 'User not found');
        }

        return Inertia::render('EditUser', [
            'user' => $entry->toArray()
        ]);
    }

    public function update(Request $request, $id)
    {
        $entry = Entry::find($id);
    
        if (!$entry) {
            return redirect()->route('home')->with('error', 'User not found');
        }
    
        $validated = $request->validate([
            'title' => ['required', 'string', 'max:255'],
            'content' => ['nullable', 'string'],
        ]);
    
        $newSlug = Str::slug($validated['title']);
    
        // Check if the new slug already exists (excluding the current entry)
        $slugExists = Entry::query()
            ->where('collection', 'users')
            ->where('slug', $newSlug)
            ->where('id', '!=', $id)
            ->exists();
    
        if ($slugExists) {
            // Append a unique identifier to the slug
            $newSlug .= '-' . uniqid();
        }
    
        $entry->set('title', $validated['title']);
        $entry->set('content', $validated['content']);
        $entry->slug($newSlug);
    
        if (Auth::check()) {
            $currentUser = Auth::user();
            $entry->set('updated_by', $currentUser->id);
        }
    
        $entry->save();
    
        return redirect()->route('home')->with('message', 'User updated successfully!');
    }

    public function delete($id)
    {
        $entry = Entry::find($id);

        if (!$entry) {
            return redirect()->route('home')->with('error', 'User not found');
        }

        $entry->delete();

        return redirect()->route('home')->with('message', 'User deleted successfully!');
    }
}
