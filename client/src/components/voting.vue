<template lang="pug">
  div
    section.hero.is-dark
      .hero-body
        .container
          h1.title General Elections in 2018
          h2.subtitle
            | Select your preferred candidate&nbsp;
            strong preferred
            | .
    section.section
      .container
        .columns
          .column(v-for='(candidate, index) in candidates', @click='vote(candidate.name)')
            .candidate-card
              img(:src='candidate.photo')
              .candadite-data
                .candidate-name \#{{index+1}} {{candidate.name}}
                div
                  span(style='font-weight:bold') Occupation:&nbsp;
                  span {{candidate.occupation}}
              div(:class='candidate.style')
                | Vote here
</template>

<script>
import NarendraModi from "@/assets/narendra_modi.jpg";
import DonaldTrump from "@/assets/donald_trump.jpg";
import BarackObama from "@/assets/barack_obama.jpg";
import VladmirPutin from "@/assets/vladmir_putin.jpg";

export default {
  name: "hello",
  data() {
    return {
      candidates: [
        {
          name: "Narendra Modi",
          country: "India"
        }
      ]
    };
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
