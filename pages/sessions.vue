<template>
	<div class="container d-grid gap-2">
	    <div></div>
		<MainCard title="Sessions Calender" />
    <Calendar />
	</div>
</template>

<script>
import 'boxicons'
export default {
  name: 'IndexPage',
  head(){
  	return{
  		title:"Sessions Calender"
  	}
  }
}
</script>
