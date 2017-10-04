<template>
    <div>
        <div class="hello">
            {{ hello }}
        </div>
        <div class="hello">{{ hello }}</div>
        <div class="hello"></div>
        <img src="">
    </div>
</template>
<script>
import heh from 'heheh';
import Hello from './test.js';

export default{
    data() {
        return {
            key: value,
            key2: value
        };
    },
    data() {
        return {
            person: { name: 'Sheepy' }
        };
    },

    computed: {

    },

    methods: {
        personName() {
            return this.person.name;
        },
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

<template>
    <div id="root">
    </div>
</template>
<script>
    export default {
        data() {
            return {
            };
        },

        computed: {
            hello() {
                return 'world';
            }
        }

    };
</script>

<style lang="less" scoped>

</style>
