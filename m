Return-Path: <linux-tegra+bounces-1714-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D28A6854
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Apr 2024 12:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32F3CB222B9
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Apr 2024 10:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B41128809;
	Tue, 16 Apr 2024 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yzh9EJN5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C21127E15
	for <linux-tegra@vger.kernel.org>; Tue, 16 Apr 2024 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713263268; cv=none; b=R4MLuCOlNLXz9ALDEonRT7mwmfpIyEJkEWU0nmGuMm4KqWsnbf6uQwGssdjMViFn3F+dpTf4eIZf4NqXzNOxAqIPpyzRLfLA3S7m338dNyswlxj7F3MR9Eb7WeKLgXqKgS2fKDvLRG62CIsTXYUO8F0vWDtjnDCq/MuHPuqaxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713263268; c=relaxed/simple;
	bh=Xw6yRzMKNze2bIDoDLlDeJwYR+bZxJqXOk9lJPUakYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8EkZhFCyzg7sSURpx7UQwqLMfvDqlkMw5dxhTWcqWIHwsHjSEQdveeykgMkDcflC3B34YlYIToYB0So5sfcuMCn0GD/UdU2uE2B4/g0jANAYgLSHSa7cpQArVygY9tZ+TcJIYOvn3b13lyoE5Me5Mpaz2GgDeXxuKbCGTw2Z0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yzh9EJN5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a450bedffdfso527272166b.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Apr 2024 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713263265; x=1713868065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm6MGDUL0CYtN0eVBnWYXSq+qBMUlxWdujWqgjIPSpk=;
        b=Yzh9EJN5N5f5AQ3pUSGzjpgz52Nxfyoa6pzhxfX7RlPoulAKXnLX/jJasWZn0bkfdh
         rWsBAi5ARGExNVrI4z/5bdHYaYjTBNxPzM6T1FkfpCSKJW65BY0MGMdkwqm0Vkfh1YE4
         Eglpj2GCQ+ePDj3j024w/PtV9f0Uhn/LcnN8NhLI5HdRc0DwpKiULqMkcALSuCD9lj/S
         1PZUlXVBBoS/d7osQDEHeRAaWS1vV1pZ8r6MhFWRwn7FC21X3AnLvPlKw4iarlurpOBW
         dR1FWNXhB+DY54YTTZiUFshGfLxQO14H6XExXJ7ABDJQ/FtX1XrwlKNq3S8V7qzCk4+t
         1wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713263265; x=1713868065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zm6MGDUL0CYtN0eVBnWYXSq+qBMUlxWdujWqgjIPSpk=;
        b=iUwpR1LGckb8QeCgUYJXOn6mYLH1phPA4YVFJXSimg2QkvKsCPmNuEg1OMJkj/Dacs
         qQ/WKDNdAyNI7J+vI3sOKzsooOKhWO5cui7QQO5JfuMmLVS0U7Rctq+Anfh3/k0tzizC
         wJQQ60T1Mg8B4oRanUzD1xx7aCVKxO/c176yrmLc2Ytkipk53JBn6RxIjRRGVJrRrwgW
         hFbdmWR4C85KIli8S1KOCZImYJFlL00LRLc67wyH+FjbsLXyE/QwfXxftfgcTsHodQPM
         97aM3krUAXcQXGxlO4Cek5gU9sDTjTKDl+WwtuW7+IlJCm9bNsGnf0JO2qCgFEoL6maI
         WeNw==
X-Forwarded-Encrypted: i=1; AJvYcCXShXOBxT+pIliV2plfxKJcxEBJlZ4gft7QYO3K56RpWv08zg8lCbkXq7Ake3IIITF8BtsnXULO3rXvhzYG+E8ej0K6f3qVtl4h9pU=
X-Gm-Message-State: AOJu0YyCnvgIlvTWgaMl4zeRr/IT5MNdv/K0c+ziKDBGoyfxx6UKjE1g
	TFBpMdO8BPKLo26pRxHul5DSEyArtDa+2DauqNxOv5uxSuiGwD5tMUGCgvY+KY8=
X-Google-Smtp-Source: AGHT+IHeCLt5rGanImY7XpLmlFa8tjPTvv3rQXuFC3a0/nphBsid89J0+cxErThPuG+j2psO/RLVdA==
X-Received: by 2002:a17:907:7d91:b0:a54:1c55:7123 with SMTP id oz17-20020a1709077d9100b00a541c557123mr3390435ejc.73.1713263265187;
        Tue, 16 Apr 2024 03:27:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bz2-20020a1709070aa200b00a51a9eccf2asm6665593ejc.125.2024.04.16.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:27:44 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:27:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Message-ID: <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>

I have created a Smatch check to warn about code like this:

drivers/media/dvb-frontends/tda10048.c:345 tda10048_set_wref() warn: unnecessary div64_u64(): divisor = '0-u32max'

regards,
dan carpenter

/*
 * Copyright 2024 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_extra.h"

static int my_id;

static const sval_t uint_max  = { .type = &uint_ctype, .value = UINT_MAX };

static void match_div64_u64(struct expression *expr)
{
	struct range_list *rl;

	get_real_absolute_rl(expr, &rl);
	if (sval_cmp(rl_max(rl), uint_max) > 0)
		return;
	sm_warning("unnecessary div64_u64(): divisor = '%s'", show_rl(rl));
}

void check_unnecessary_div64_u64(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_param_key_expr_hook("div64_u64", match_div64_u64, 1, "$", NULL);
}

