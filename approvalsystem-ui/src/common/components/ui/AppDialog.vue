<script lang="ts">
import { Vue, Component, Prop } from 'vue-property-decorator'

//*===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷Primary

@Component
export default class Dialog extends Vue {
  //*===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜Props

  @Prop(Boolean) value: boolean // * v-model at parent level

  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data

  isActive = false
  initialDelay = 0

  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed

  // * GetSet, Handling visibility of the dialog
  get isOpen() {
    return this.value && this.isActive
  }

  // * GetSet, delay-close dialog at parent level, to display closing animation
  set isOpen(value: boolean) {
    this.isActive = value

    setTimeout(() => {
      this.$emit('input', value)
    }, 300)
  }

  //*===🦌===🦌===🦌===🦌===🦌===🦌===🦌===🦌===🦌===🦌===🦌===🦌Hooks

  mounted() {
    setTimeout(() => {
      this.isActive = true
    }, this.initialDelay)
  }
}
</script>
