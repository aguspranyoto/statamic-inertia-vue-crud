<script setup lang="ts">
import { router, useForm, usePage } from "@inertiajs/vue3";

const form = useForm({
    title: "",
    content: "",
});

const submit = () => {
    router.post("/store", form.data());
};
</script>

<template>
    <div class="container mx-auto max-w-sm p-4">
        <h1 class="text-2xl font-medium mb-4">Create User</h1>

        <form @submit.prevent="submit" class="space-y-4">
            <div class="flex items-center">
                <label for="title" class="text-gray-700 mr-2 w-1/4"
                    >Title</label
                >
                <input
                    type="text"
                    name="title"
                    id="title"
                    v-model="form.title"
                    class="w-full px-3 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-1 focus:ring-blue-500"
                />
            </div>
            <div class="flex items-center">
                <label for="content" class="text-gray-700 mr-2 w-1/4"
                    >content</label
                >
                <input
                    type="text"
                    name="content"
                    id="content"
                    v-model="form.content"
                    class="w-full px-3 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-1 focus:ring-blue-500"
                />
            </div>
            <div>
                <button
                    type="submit"
                    class="w-full px-4 py-2 rounded-md bg-blue-500 text-white font-medium hover:bg-blue-700"
                >
                    Create
                </button>
            </div>
        </form>
    </div>
</template>
