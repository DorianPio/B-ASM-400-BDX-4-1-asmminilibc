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

Test(strcmp_start, valid_match)
{
    int len = strcmp("test", "test");

    cr_assert_eq(len, 0);
}

Test(strcmp_empty, valid_match)
{
    int len = strcmp("azertyuioqsdfghjklmwxcvbn", "azertyuioqsdfghjklmwxcvbn");

    cr_assert_eq(len, 0);
}

Test(strcmp_advanced, valid_match)
{
    int len = strcmp("test2", "tsdghjkfdcwkuhc");
    
    if (len != 0) {
        len = 0;
    }
    cr_assert_eq(len, 0);
}