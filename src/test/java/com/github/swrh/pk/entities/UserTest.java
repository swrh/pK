package com.github.swrh.pk.entities;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class UserTest {

    @Test
    public void whenCalledGetName_thenCorrect() {
        User user = new User("Julie", "julie@domain.com");

        assertThat(user.getName()).isEqualTo("Julie");
    }

    @Test
    public void whenCalledGetEmail_thenCorrect() {
        User user = new User("Julie", "julie@domain.com");

        assertThat(user.getEmail()).isEqualTo("julie@domain.com");
    }

    @Test
    public void whenCalledSetName_thenCorrect() {
        User user = new User("Julie", "julie@domain.com");

        user.setName("John");

        assertThat(user.getName()).isEqualTo("John");
    }

    @Test
    public void whenCalledSetEmail_thenCorrect() {
        User user = new User("Julie", "julie@domain.com");

        user.setEmail("john@domain.com");

        assertThat(user.getEmail()).isEqualTo("john@domain.com");
    }

    @Test
    public void whenCalledToString_thenCorrect() {
        User user = new User("Julie", "julie@domain.com");
        assertThat(user.toString()).isEqualTo("User{id=0, name='Julie', email='julie@domain.com'}");
    }

}
