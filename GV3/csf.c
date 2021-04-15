/*
 * Sux: Succinct data structures
 *
 * Copyright (C) 2018-2020 Sebastiano Vigna
 *
 *  This library is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU Lesser General Public License as published by the Free
 *  Software Foundation; either version 3 of the License, or (at your option)
 *  any later version.
 *
 *  This library is distributed in the hope that it will be useful, but
 *  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 *  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
 *  for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 */

#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
/*#include <stdio.h>*/
#include <string.h>
#include "csf.h"

csf_t *load_csf(int h) {
	uint64_t decoding_table_length;
	uint64_t num_symbols;
	uint64_t t;
	csf_t *temp;
	csf_t *csf;
	temp = calloc(1, sizeof(*csf));
	read(h, &temp->size, sizeof(csf->size));

	read(h, &t, sizeof(t));
	temp->multiplier = t;

	read(h, &t, sizeof(t));
	temp->global_max_codeword_length = t;

	read(h, &temp->global_seed, sizeof(temp->global_seed));
	read(h, &temp->offset_and_seed_length, sizeof(temp->offset_and_seed_length));
	temp->offset_and_seed = malloc(temp->offset_and_seed_length * sizeof(*temp->offset_and_seed));
	read(h, temp->offset_and_seed, temp->offset_and_seed_length * sizeof(*temp->offset_and_seed));

	read(h, &temp->array_length, sizeof(temp->array_length));

	temp->array = malloc(temp->array_length * sizeof(*temp->array));
	read(h, temp->array, temp->array_length * sizeof(*temp->array));

	/*Decoder*/
	read(h, &temp->escaped_symbol_length, sizeof(temp->escaped_symbol_length));
	read(h, &temp->escape_length, sizeof(temp->escape_length));
	read(h, &decoding_table_length, sizeof(decoding_table_length));
	read(h, &num_symbols, sizeof(num_symbols));

	/*Compact*/
	char *p = malloc(sizeof(*temp) 
				+ decoding_table_length * sizeof(*temp->last_codeword_plus_one) 
				+ decoding_table_length * sizeof(*temp->how_many_up_to_block) 
				+ ((decoding_table_length + 7) & ~7ULL) * sizeof(*temp->shift)/*WARNING Added parentheses for improved readability **(decoding_table_length + 7)** */
				+ num_symbols * sizeof(*temp->symbol));
	csf = memcpy(p, temp, sizeof(*temp));
	free(temp);

	p += sizeof *csf;

	csf->last_codeword_plus_one = (uint64_t *)p;
	p += read(h, csf->last_codeword_plus_one, decoding_table_length * sizeof *csf->last_codeword_plus_one);

	csf->how_many_up_to_block = (uint32_t *)p;
	p += read(h, csf->how_many_up_to_block, decoding_table_length * sizeof *csf->how_many_up_to_block);

	csf->shift = (uint8_t *)p;
	read(h, csf->shift, decoding_table_length * sizeof *csf->shift);
	p += (decoding_table_length + 7) & ~7ULL; /*Realign*/ /*WARNING Added parentheses for improved readability **(decoding_table_length + 7)** */

	csf->symbol = (uint64_t *)p;
	read(h, csf->symbol, num_symbols * sizeof *csf->symbol);

	return csf;
}

void destroy_csf(csf_t* csf)
{
	free(csf->array);
	csf->array = NULL;
	free(csf->offset_and_seed);
	csf->offset_and_seed = NULL;
	free(csf);
}
