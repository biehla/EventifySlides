<script setup>
import { computed, ref } from 'vue'
import { onSlideEnter, onSlideLeave } from '@slidev/client'

const props = defineProps({
  src: String,
  scale: {
    type: Number,
    default: 0.75
  }
})

const inverseScale = computed(() => `${(1 / props.scale) * 100}%`)
const iframeSrc = ref(props.src)
const isVisible = ref(true)
const iframeRef = ref(null)

// Function to clear storage
const clearStorage = () => {
  try {
    // Clear cookies
    document.cookie.split(";").forEach(cookie => {
      document.cookie = cookie
        .replace(/^ +/, "")
        .replace(/=.*/, `=;expires=${new Date(0).toUTCString()};path=/`)
    })
    
    // Clear localStorage
    localStorage.clear()
    
    // Clear sessionStorage
    sessionStorage.clear()
    
    // Clear IndexedDB databases
    if (window.indexedDB) {
      const databases = indexedDB.databases()
      databases.then(dbs => {
        dbs.forEach(db => {
          indexedDB.deleteDatabase(db.name)
        })
      })
    }
  } catch (e) {
    console.error('Error clearing storage:', e)
  }
}

// Function to unload iframe
const unloadIframe = () => {
  setTimeout(() => {
    clearStorage()
    isVisible.value = false
    iframeSrc.value = ''
  }, 500)
}

// Function to reload iframe
const reloadIframe = () => {
  isVisible.value = true
  iframeSrc.value = props.src
}

// Slidev hooks
onSlideEnter(() => {
  reloadIframe()
})

onSlideLeave(() => {
  unloadIframe()
})
</script>

<template>
  <div class="ns-c-center-item w-full h-full">
    <iframe 
      v-if="isVisible"
      ref="iframeRef"
      title="Eventify" 
      id="iframe" 
      :src="iframeSrc" 
      loading="lazy"
      sandbox="allow-same-origin allow-scripts allow-popups allow-forms"
      :style="{
        width: inverseScale,
        height: inverseScale,
        transform: `scale(${scale})`,
        '-webkit-transform': `scale(${scale})`,
        '-moz-transform': `scale(${scale})`,
        '-o-transform': `scale(${scale})`,
        zoom: scale
      }"
    ></iframe>
  </div>
</template>

<style>
iframe {
  border: 0;
  transform-origin: 0 0;
  -moz-transform-origin: 0 0;
  -o-transform-origin: 0 0;
  -webkit-transform-origin: 0 0;
}

@media screen and (-webkit-min-device-pixel-ratio:0) {
  iframe {
    zoom: 1;
  }
}
</style>

<style scoped>
div {
  width: 100%;
  height: 100%;
  padding: 0;
  margin: 0;
  overflow: hidden;
}
</style>
