<template lang="pug">
  div
    section.hero.is-dark
      .hero-body
        .container
          h1.title Elections 2018
          h2.subtitle
            | Select a suitable candidate that you&nbsp;
            strong prefer
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
import BarackObama from "@/assets/barack_obama.jpg";
import DonaldTrump from "@/assets/donald_trump.jpg";
import VladmirPutin from "@/assets/vladmir_putin.jpeg";

export default {
  name: "hello",
  data() {
    return {
      candidates: [
        {
          name: "Narendra Modi",
          style: "notification is-info",
          photo: NarendraModi,
          occupation: "Prime Minister"
        },
        {
          name: "Barack Obama",
          style: "notification is-success",
          photo: BarackObama,
          occupation: "Ex President"
        },
        {
          name: "Donald Trump",
          style: "notification is-warning",
          photo: DonaldTrump,
          occupation: "President"
        },
        {
          name: "Vladmir Putin",
          style: "notification is-danger",
          photo: VladmirPutin,
          occupation: "President"
        }
      ]
    };
  },
  methods: {
    vote(candidate) {
      this.$emit("vote", candidate);
    }
  }
};
</script>

<!-- using stylus and scoped to limit css to this only -->
<style lang="stylus">
.candidate-card {
  display: flex;
  align-content: center;
  flex-wrap: wrap;

  .candadite-data {
    justify-content: flex-start;
    padding-left: 5px;

    .candidate-name {
      font-weight: bold;
      font-size: 1.3em;
    }
  }

  .notification {
    text-align: center;
    min-width: 225px;
    margin-top: 5px;
  }
}
</style>
