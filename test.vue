<template>
    <div>
        <div class="hello">
            {{ shshsh }}
        </div>
        <div class="hello"></div>
        <div class="hello"></div>
    </div>
</template>

<script>
import heh from 'heheh';
export default{
    data() {
        return {
            person: { name: 'Sheepy' }
        };
    },

    computed: {
        personName() {
            return this.person.name;
        }
    }

    methods: {
        fetch() {
            return this.get();
        }
    }

};
</script>

<style lang="less" scoped>
    .hello {
        width: 32px;
        height: 66px;
    }
</style>


