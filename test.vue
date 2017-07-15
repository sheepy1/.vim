<template>
    <div>
        <div class="hello">
            {{ hello }}
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
            key: value,
            key2: value
        };
    }
    data() {
        return {
            person: { name: 'Sheepy' }
        };
    },
    computed: {
        personName() {
            return this.person.name;
        }
    },
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

<template>
    <div id="root">
    </div>
</template>

<script>
    export default {
        data() {
            return {
                this.hello
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
