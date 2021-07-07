<template>
    <q-layout view="lHh Lpr lFf" class="my-layout">
        <q-page-container>
            <router-view />
        </q-page-container>
    </q-layout>
</template>

<script>
    import {defineComponent} from "vue"

    export default defineComponent({
        name: "MainLayout",
    })
</script>

<style lang="scss">
    .my-layout {
        background: $primary;
    }
</style>
