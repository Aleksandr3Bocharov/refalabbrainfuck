// Copyright 2026 Aleksandr Bocharov
// Distributed under the Boost Software License, Version 1.0.
// See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt
// 2026-05-25
// https://github.com/Aleksandr3Bocharov/refalabbrainfuck

//====================================================================
// Модуль "interpretatorc"
//====================================================================

#include <stdio.h>
#include <stdint.h>
#include "refalab.h"

// <Put_Char S(N).Char> ==
static void put_char_(void)
{
    const T_LINKCB *linkcb_number = refal.previous_argument->next;
    if (linkcb_number->next != refal.next_argument || linkcb_number->tag != TAGN)
    {
        refal.upshot = 2;
        return;
    }
    if (putchar((int)gcoden(linkcb_number)) == EOF)
        if (feof(stdout) != 0 || ferror(stdout) != 0)
            refal_abort_end("put_char: error");
    fflush(stdout);
    return;
}
char put_char_0[] = {Z0 'P', 'U', 'T', '_', 'C', 'H', 'A', 'R', (char)8};
G_L_B uint8_t refalab_put_char = '\122';
void (*put_char_1)(void) = put_char_;

// <Get_Char> == S(0..255).Char
static void get_char_(void)
{
    if (refal.previous_argument->next != refal.next_argument)
    {
        refal.upshot = 2;
        return;
    }
    const int symbol = getchar();
    refal.previous_argument->tag = TAGN;
    refal.previous_argument->info.codep = NULL;
    if (symbol != EOF)
        pcoden(refal.previous_argument, (uint8_t)symbol);
    else
        clearerr(stdin);
    transplantation(refal.previous_result, refal.previous_argument->previous, refal.previous_argument->next);
    return;
}
char get_char_0[] = {Z0 'G', 'E', 'T', '_', 'C', 'H', 'A', 'R', (char)8};
G_L_B uint8_t refalab_get_char = '\122';
void (*get_char_1)(void) = get_char_;
