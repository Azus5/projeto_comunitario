<template>
  <div>
    <Header />
    <div class="container-fluid mt-5">
      <div class="row">
        <div class="col"></div>
        <div class="col-lg-4 col-sm-12">
          <div class="row">
            <div class="col-lg-6 col-sm-12 text-center">
              <span
                class="btn pointer"
                @click="signup = false"
                :class="!signup ? 'btn-primary' : 'btn-outline-primary'"
              >
                Faça seu login
              </span>
            </div>
            <div class="col-lg-6 col-sm-12 text-center">
              <span
                class="btn pointer"
                @click="signup = true"
                :class="signup ? 'btn-primary' : 'btn-outline-primary'"
              >
                Faça seu cadastro
              </span>
            </div>
            <transition name="slide-fade">
              <div class="col-lg-12 col-sm-12 mt-3" v-if="signup">
                <span class="text-left">Nome: </span>
                <input
                  type="text"
                  placeholder="Digite o seu nome"
                  class="form-control"
                  v-model="name"
                />
              </div>
            </transition>
            <div class="col-lg-12 col-sm-12 mt-2">
              <span class="text-left">Email: </span>
              <input
                type="email"
                placeholder="Digite o seu email"
                class="form-control"
                v-model="email"
              />
            </div>
            <div class="col-lg-12 col-sm-12 mt-2">
              <span class="text-left">Senha: </span>
              <input
                type="password"
                placeholder="Digite a sua senha"
                class="form-control"
                v-model="password"
              />
            </div>
            <transition name="slide-fade">
              <div class="col-lg-12 col-sm-12 mt-2" v-if="signup">
                <span class="text-left">Confirmação da Senha: </span>
                <input
                  type="password"
                  placeholder="Digite a sua senha"
                  class="form-control"
                  @focus="() => (errors.passwords_diff = false)"
                  :class="{ 'is-invalid': errors.passwords_diff }"
                  v-model="password_confirmation"
                />
                <b
                  v-if="errors.passwords_diff"
                  class="text-danger"
                  style="font-size: 14px"
                >
                  As senhas não são iguais
                </b>
              </div>
            </transition>
            <div class="col-lg-12 col-sm-12 mt-3">
              <button
                style="background-color: #dc3545"
                class="btn text-white w-100"
                @click="handleClick"
              >
                {{ signup ? "Cadastrar-se" : "Entrar" }}
              </button>
            </div>
          </div>
        </div>
        <div class="col"></div>
      </div>
    </div>
  </div>
</template>

<script>
import Header from "@/components/Header.vue";
import axios from "axios";

export default {
  name: "Credenciais",
  props: ["student", "professor"],
  components: { Header },
  data: () => ({
    signup: true,
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
    errors: {
      passwords_diff: false,
    },
  }),
  methods: {
    handleClick() {
      if (this.signup) {
        this.handleSignup();
        return;
      }

      this.handleLogin();
    },
    handleSignup() {
      if (this.password != this.password_confirmation) {
        this.errors.passwords_diff = true;
        return;
      }
      let data = {
        student: {
          name: this.name,
          email: this.email,
          password: this.password,
        },
      };

      if (this.professor) data = { professor: data.student };

      let url = this.student ? "/students" : "/professors";
      axios
        .post(url, data)
        .then((response) => {
          if (response.data.status) {
            this.$toast.success("Cadastro efetuado com sucesso!");
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    handleLogin() {
      let user = {
        email: this.email,
        password: this.password,
      };

      let base = this.student ? "/students/" : "/professors/";
      axios.post(base + "sign_in", { user }).then((response) => {
        if (response.data.status) {
          this.$inertia.visit("/");
          return;
        }

        this.$toast.error("Senha incorreta");
      });
    },
  },
};
</script>