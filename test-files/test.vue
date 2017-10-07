<template>
    <div id="root">
        <div class="title-container">
            <div class="title"></div>
            <div class="subtitle"></div>
        </div>
    </div>
</template>

<script>
export default {
    created() {

    },

   mounted() {

    },

    data() {
        return {

        };
    },

    computed: {

    },

    methods: {
        killTime() {
            console.log('kill time');
        }
    },

    components: {

    }
};
</script>

<style lang="less" scoped>
.root {
    height: 30px;
    width: 40px;
    display: flex;
    justify-content: space-around;
}
</style>
