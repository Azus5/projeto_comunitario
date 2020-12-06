<template>
  <div class="container-fluid mb-5">
    <Header :student="student" :professor="professor" />
    <div class="row mt-5 px-5">
      <div class="col-lg-12">
        <div class="row">
          <div class="col"></div>
          <div class="col-lg-6">
            <div
              class="row p-4 text-white"
              style="background-color: #243e85; border-radius: 7px"
            >
              <div class="col-lg-12 mb-2">
                <h3 class="text-center font-weight-bold">
                  Cadastro de Estágio
                </h3>
              </div>
              <div class="col-lg-12 mt-1">
                <span class="d-block" style="font-size: 20px">Cargo</span>
                <input
                  type="text"
                  v-model="occupation"
                  class="form-control d-block"
                  placeholder="Cargo"
                />
              </div>
              <div class="col-lg-12 mt-3">
                <span class="d-block" style="font-size: 20px">Empresa</span>
                <input
                  type="text"
                  v-model="institution"
                  class="form-control d-block"
                  placeholder="Empresa"
                />
              </div>
              <div class="col-lg-12 mt-3">
                <span class="d-block" style="font-size: 20px">Cidade</span>
                <input
                  type="text"
                  v-model="city"
                  class="form-control d-block"
                  placeholder="Cidade"
                />
              </div>
              <div class="col-lg-12 mt-3">
                <span class="d-block" style="font-size: 20px">Estado</span>
                <input
                  type="text"
                  v-model="state"
                  class="form-control d-block"
                  placeholder="Estado"
                />
              </div>
              <div class="col-lg-12 mt-3">
                <span class="d-block" style="font-size: 20px">Remuneração</span>
                <input
                  type="text"
                  v-model="remuneration"
                  class="form-control d-block"
                  placeholder="Remuneração"
                />
              </div>
              <div class="col-lg-12 mt-3">
                <button class="btn btn-success w-100" @click="save">
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
  props: ["student", "professor"],
  components: { Header },
  data: () => ({
    occupation: "",
    institution: "",
    city: "",
    state: "",
    remuneration: "",
  }),
  methods: {
    save() {
      let data = {
        internships: {
          occupation: this.occupation,
          institution: this.institution,
          city: this.city,
          state: this.state,
          remuneration: parseFloat(this.remuneration),
        },
      };

      axios.post("/professors/internships", data).then((response) => {
        this.$toast.success("Estágio criado com sucesso!");
        this.$inertia.visit(
          `/professors/internships/${response.data.internship.id}`
        );
      });
    },
  },
};
</script>