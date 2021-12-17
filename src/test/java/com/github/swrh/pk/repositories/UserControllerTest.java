package com.github.swrh.pk.repositories;

import com.github.swrh.pk.controllers.UserController;
import com.github.swrh.pk.entities.User;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import static com.github.swrh.pk.controllers.UserController.MAPPING_BASE;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class UserControllerTest {

    private static UserController userController;
    private static UserRepository mockedUserRepository;
    private static BindingResult mockedBindingResult;
    private static Model mockedModel;

    @BeforeAll
    public static void setUpUserControllerInstance() {
        mockedUserRepository = mock(UserRepository.class);
        mockedBindingResult = mock(BindingResult.class);
        mockedModel = mock(Model.class);
        userController = new UserController(mockedUserRepository);
    }

    @Test
    public void whenCalledIndex_thenCorrect() {
        assertThat(userController.showUserList(mockedModel))
                .isEqualTo(MAPPING_BASE + "/index");
    }

    @Test
    public void whenCalledshowSignUpForm_thenCorrect() {
        User user = new User("John", "john@domain.com");

        assertThat(userController.showSignUpForm(user))
                .isEqualTo(MAPPING_BASE + "/new");
    }

    @Test
    public void whenCalledaddUserAndValidUser_thenCorrect() {
        User user = new User("John", "john@domain.com");

        when(mockedBindingResult.hasErrors()).thenReturn(false);

        assertThat(userController.addUser(user, mockedBindingResult, mockedModel))
                .isEqualTo("redirect:/" + MAPPING_BASE + "/");
    }

    @Test
    public void whenCalledaddUserAndInValidUser_thenCorrect() {
        User user = new User("John", "john@domain.com");

        when(mockedBindingResult.hasErrors()).thenReturn(true);

        assertThat(userController.addUser(user, mockedBindingResult, mockedModel))
                .isEqualTo(MAPPING_BASE + "/new");
    }

    @Test
    public void whenCalledshowUpdateForm_thenIllegalArgumentException() {
        assertThatThrownBy(() -> userController.showUpdateForm(0, mockedModel))
                .isInstanceOf(IllegalArgumentException.class);
    }

    @Test
    public void whenCalledupdateUserAndValidUser_thenCorrect() {
        User user = new User("John", "john@domain.com");

        when(mockedBindingResult.hasErrors()).thenReturn(false);

        assertThat(userController.updateUser(1l, user, mockedBindingResult, mockedModel))
                .isEqualTo("redirect:/" + MAPPING_BASE + "/");
    }

    @Test
    public void whenCalledupdateUserAndInValidUser_thenCorrect() {
        User user = new User("John", "john@domain.com");

        when(mockedBindingResult.hasErrors()).thenReturn(true);

        assertThat(userController.updateUser(1l, user, mockedBindingResult, mockedModel))
                .isEqualTo(MAPPING_BASE + "/edit");
    }

    @Test
    public void whenCalleddeleteUser_thenIllegalArgumentException() {
        assertThatThrownBy(() -> userController.deleteUser(1l, mockedModel))
                .isInstanceOf(IllegalArgumentException.class);
    }

}
