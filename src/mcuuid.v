module mcuuid

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// Copyright (c) 2023 illyum
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


import json
import net.http

struct MCUUID {
	pub:
	name string
	uuid string
}



struct Player {
	name string
	id string
}

pub fn mcuuid(id string) MCUUID {
	mut url := ""

	if id.len <= 16 {
		url = "https://api.mojang.com/users/profiles/minecraft/" + id
	} else if id.len == 32 || id.len == 36 {
		url = "https://sessionserver.mojang.com/session/minecraft/profile/" + id
	} else {
		panic("Something went wrong")
		return MCUUID{}
	}

	response := http.get(url) or { return MCUUID{} }
	data := json.decode(Player, response.body) or { return MCUUID{} }

	player := MCUUID{
		name: data.name
		uuid: data.id
	}

	return player
}