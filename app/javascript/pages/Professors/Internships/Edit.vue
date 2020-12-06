<template>
  <div class="container-fluid mb-5">
    <Header :student="student" :professor="professor" />
    <div class="row mt-5 px-5">
      <div class="col-lg-12">
        <div class="row">
          <div class="col"></div>
          <div class="col-lg-8">
            <div
              class="row p-4 text-white"
              style="background-color: #243e85; border-radius: 7px"
            >
              <div class="col-lg-12 mb-2">
                <h3 class="text-center font-weight-bold">Edição do Estágio</h3>
              </div>
              <div class="col-lg-6 mb-2">
                <span class="d-block" style="font-size: 20px">Cargo</span>
                <input
                  type="text"
                  v-model="occupation"
                  class="form-control d-block"
                  placeholder="Cargo"
                />
              </div>
              <div class="col-lg-6 mb-2">
                <span class="d-block" style="font-size: 20px">Empresa</span>
                <input
                  type="text"
                  v-model="institution"
                  class="form-control d-block"
                  placeholder="Empresa"
                />
              </div>
              <div class="col-lg-6">
                <span class="d-block" style="font-size: 20px">Cidade</span>
                <input
                  type="text"
                  v-model="city"
                  class="form-control d-block"
                  placeholder="Cidade"
                />
              </div>
              <div class="col-lg-2">
                <span class="d-block" style="font-size: 20px">Estado</span>
                <input
                  type="text"
                  maxlength="2"
                  v-model="state"
                  class="form-control d-block"
                  placeholder="Estado"
                />
              </div>
              <div class="col-lg-4">
                <span class="d-block" style="font-size: 20px">Remuneração</span>
                <input
                  type="text"
                  v-model="remuneration"
                  class="form-control d-block"
                  placeholder="Remuneração"
                />
              </div>
              <div class="col-lg-12">
                <span class="d-block" style="font-size: 20px">Beneficios</span>
                <textarea
                  v-model="benefits"
                  class="form-control d-block"
                  placeholder="Beneficios"
                  rows="3"
                />
              </div>
              <div class="col-lg-12">
                <span class="d-block" style="font-size: 20px">Descrição</span>
                <textarea
                  v-model="description"
                  class="form-control d-block"
                  placeholder="Descrição"
                  rows="10"
                />
              </div>
              <div class="col-lg-12 mt-3">
                <button class="btn btn-success w-100" @click="update">
                  Salvar
                </button>
              </div>
            </div>
          </div>
          <div class="col"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Header from "@/components/Header.vue";

export default {
  props: ["student", "professor", "internship"],
  components: { Header },
  data: () => ({
    occupation: "",
    institution: "",
    city: "",
    state: "",
    remuneration: "",
    description: "",
    benefits: "",
  }),
  mounted() {
    this.occupation = this.internship.occupation;
    this.institution = this.internship.institution;
    this.city = this.internship.city;
    this.state = this.internship.state;
    this.remuneration = this.internship.remuneration;
    this.description = this.internship.description;
    this.benefits = this.internship.benefits;
  },
  methods: {
    update() {
      let data = {
        internships: {
          occupation: this.occupation,
          institution: this.institution,
          city: this.city,
          state: this.state,
          remuneration: parseFloat(this.remuneration),
          description: this.description,
          benefits: this.benefits,
        },
      };

      axios
        .post(`/professors/internships/${this.internship.id}`, data)
        .then((response) => {
          if (response.data.status) {
            this.$toast.success("Dados salvos com sucesso");
          }
        });
    },
  },
};
</script>