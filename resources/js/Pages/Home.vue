<script setup lang="ts">
import { Link, router, usePage } from "@inertiajs/vue3";

const props = defineProps({
    users: Object,
    required: true,
});

const deleteUser = (id) => {
    if (confirm("Are you sure you want to delete this user?")) {
        router.delete(`/delete/${id}`);
    }
};
</script>

<template>
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-semibold mb-6">Home Page</h1>

        <Link
            href="/create"
            class="inline-block bg-blue-500 text-white px-4 py-2 rounded-md shadow-md hover:bg-blue-600 mb-6"
        >
            Create
        </Link>

        <div
            v-if="$page.props.flash.message"
            class="mb-4 p-4 bg-green-100 text-green-800 border border-green-300 rounded-md"
        >
            {{ $page.props.flash.message }}
        </div>

        <div class="overflow-x-auto">
            <table
                class="min-w-full bg-white border border-gray-200 rounded-md shadow-md"
            >
                <thead class="bg-gray-100 text-gray-600 uppercase text-sm">
                    <tr>
                        <th class="py-3 px-4 border-b">Title</th>
                        <th class="py-3 px-4 border-b">Slug</th>
                        <th class="py-3 px-4 border-b">Content</th>
                        <th class="py-3 px-4 border-b">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-gray-700">
                    <tr
                        v-for="user in props.users"
                        :key="user.slug"
                        class="hover:bg-gray-50"
                    >
                        <td class="py-3 px-4 border-b">{{ user.title }}</td>
                        <td class="py-3 px-4 border-b">{{ user.slug }}</td>
                        <td class="py-3 px-4 border-b">{{ user.content }}</td>
                        <td class="py-3 px-4 border-b">
                            <Link
                                :href="`/edit/${user.id}`"
                                class="text-blue-500 hover:underline mr-2"
                            >
                                Edit
                            </Link>
                            <button
                                @click="deleteUser(user.id)"
                                class="text-red-500 hover:underline"
                            >
                                Delete
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
