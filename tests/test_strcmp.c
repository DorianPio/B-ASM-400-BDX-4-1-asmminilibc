/*
** EPITECH PROJECT, 2019
** Criterion test
** File description:
** Test criterion 4/5
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include <stddef.h>
#include <string.h>

Test(strlen_normal, valid_match)
{
    int len = strlen("test");

    cr_assert_eq(len, 4);
}

Test(strlen_empty, valid_match)
{
    int len = strlen("");

    cr_assert_eq(len, 0);
}

Test(strlen_advanced, valid_match)
{
    int len = strlen("tototodjkli");

    cr_assert_eq(len, 11);
}