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
          style: "notification is-info",
          photo: 'NarendraModi',
          country: "India"
        },
        {
          name: "Donald Trump",
          style: "notification is-info",
          photo: 'DonaldTrump',
          country: "USA"
        },
        {
          name: "Barack Obama",
          style: "notification is-info",
          photo : 'BarackObama',
          country: 'USA'
        },
        {
          name: "Vladmir Putin",
          style: "notification is-info",
          photo: 'VladmirPutin',
          country: 'Russia'
        };
      ]
    }
  }
  methods: {

      vote(candidate){
        $this.emit('vote',candidate);
      }


  }
};
</script>


<style lang="stylus">

.candidate-card{
  display: flex;
  align-content: center;
  flex-wrap: wrap;
  candidate-data{
  justify-content : flex-start;
  padding-left: 5px;

  candidate-name: {
    font-weight: bold;
    font-weight: 1.3em;
  }
}
.notification{
  text-align: center;
  min-width : 225px;
  margin-top: 5px;

}

}
</style>
