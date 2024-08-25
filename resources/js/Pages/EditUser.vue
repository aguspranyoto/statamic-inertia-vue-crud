<script setup lang="ts">
import { router, useForm } from "@inertiajs/vue3";
import { ref, watch } from "vue";

const props = defineProps({
    user: {
        type: Object,
        required: true,
    },
});

const form = useForm({
    title: props.user.title,
    content: props.user.content,
});

const currentSlug = ref(props.user.slug);
const slugWillChange = ref(false);

watch(
    () => form.title,
    (newTitle) => {
        slugWillChange.value =
            newTitle.toLowerCase().replace(/ /g, "-") !== currentSlug.value;
    }
);

const submit = () => {
    router.put(`/update/${props.user.id}`, form.data());
};
</script>

<template>
    <div class="container mx-auto max-w-sm p-4">
        <h1 class="text-2xl font-medium mb-4">Edit User</h1>

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
                <label class="text-gray-700 mr-2 w-1/4">Current Slug</label>
                <span class="text-gray-500">{{ currentSlug }}</span>
            </div>
            <div v-if="slugWillChange" class="text-sm text-yellow-600">
                Note: The slug will be automatically updated based on the new
                title.
            </div>
            <div class="flex items-center">
                <label for="content" class="text-gray-700 mr-2 w-1/4"
                    >Content</label
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
                    Update
                </button>
            </div>
        </form>
    </div>
</template>
