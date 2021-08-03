<template>
    <q-page class="flex column flex-center justify-between">
        <div class="q-ma-sm">
            <q-btn
                flat
                color="white"
                icon="facebook"
                type="a"
                target="_blank"
                href="https://www.facebook.com/eletromarquez/"
            >
                <q-tooltip> fb.me/eletromarquez </q-tooltip>
            </q-btn>
        </div>
        <q-card style="width: 95vw; max-width: 500px">
            <q-card-section class="flex flex-center">
                <img alt="Quasar logo" src="~assets/logo.svg" style="width: 300px; height: 300px" />
            </q-card-section>

            <q-card-actions vertical align="right">
                <transition-group appear enter-active-class="animated fadeIn" leave-active-class="animated fadeOut">
                    <q-btn
                        v-for="(link, index) of links"
                        :flat="index != 0"
                        :key="index"
                        type="a"
                        :href="link.url"
                        target="_blank"
                        :label="link.label"
                        color="primary"
                        class="full-width"
                    >
                        <q-tooltip v-if="link.caption"> {{ link.caption }} </q-tooltip>
                    </q-btn>
                </transition-group>
            </q-card-actions>
        </q-card>
        <div class="column q-pa-none q-ma-none full-width justify-end items-center">
            <q-chip square dense color="primary" text-color="white"> v{{ version }} </q-chip>
            <q-linear-progress v-if="isLoading" indeterminate color="white" />
        </div>
    </q-page>
</template>

<script>
    import {defineComponent, ref} from "vue"
    import {api} from "boot/axios"
    import {useQuasar} from "quasar"

    export default defineComponent({
        name: "PageIndex",

        setup() {
            const $q = useQuasar()

            const defaultLink = {
                caption: "Sistema Principal Eletromarquez",
                label: "Principal",
                url: "https://erp.eletromarquez.app",
                value: 1,
                position: 0,
            }

            const storageLinks = $q.localStorage.getItem("links") ?? [{...defaultLink}]

            const {version, productName} = require("../../package.json")
            const isLoading = ref("false")
            const links = ref([...storageLinks])

            document.title = productName

            isLoading.value = true

            api.get("apps/list")
                .then((response) => {
                    links.value = [...response.data.items]
                    !links.value.length && links.value.push({...defaultLink})
                    $q.localStorage.set("links", [...response.data.items])
                })
                .catch((error) => {
                    console.error(error)

                    $q.notify({
                        message: "Não foi possível atualizar os links.",
                        type: "negative",
                    })
                })
                .finally(() => {
                    isLoading.value = false
                })

            return {
                links,
                isLoading,
                version,
            }
        },
    })
</script>
