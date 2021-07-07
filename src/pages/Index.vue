<template>
    <q-page class="flex flex-center">
        <q-card style="width: 95vw; max-width: 500px">
            <q-card-section class="flex flex-center">
                <img alt="Quasar logo" src="~assets/logo.svg" style="width: 300px; height: 300px" />
            </q-card-section>

            <q-card-actions vertical align="right">
                <q-btn flat v-for="(link, index) of links" :key="index" type="a" :href="link.url" target="_blank">
                    {{ link.label }}
                    <q-tooltip v-if="link.caption"> {{ link.caption }} </q-tooltip>
                </q-btn>
            </q-card-actions>
        </q-card>
    </q-page>
</template>

<script>
    import {defineComponent, ref, onMounted} from "vue"
    import {api} from "boot/axios"
    import {productName} from "app/package.json"

    export default defineComponent({
        name: "PageIndex",

        setup() {
            const links = ref([
                {
                    caption: "Sistema Principal Eletromarquez",
                    label: "Principal",
                    url: "https://erp.eletromarquez.app",
                    value: 1,
                },
            ])

            onMounted(() => {
                document.title = productName
                api.get("apps/list")
                    .then((response) => {
                        links.value = [...response.data.itens]
                    })
                    .catch(console.error)
            })

            return {
                links,
            }
        },
    })
</script>
