Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D92636EC
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Jul 2019 15:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfGIN1C (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 9 Jul 2019 09:27:02 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19119 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfGIN1B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Jul 2019 09:27:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2496200000>; Tue, 09 Jul 2019 06:26:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jul 2019 06:27:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jul 2019 06:27:00 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 13:26:58 +0000
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To:     Dmitry Osipenko <digetx@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
CC:     <eben@raspberrypi.org>, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
 <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
Date:   Tue, 9 Jul 2019 14:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562678816; bh=s73oTYTM08Oeq+0/P4ttfVD0Pm01N/wNJBwR+DDHCF0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=eqJ1cz77lJnc/EazFhT2KqXRs5NBPXpmlT7h/kpi+rcIPdoma9kIZ+Kt4RjEkEYl4
         ZzIzY3vKBESG5lYtF5X3Na/P4hLmcERoAQ2thPz+CkwDgSiZkK4RmdqvIrPt2d54Mx
         V6RgdLy+/PYxj3gN28QJal7irFrmF6nE2d9QRI61RvRC5nFk1A2VRvamP1DZ6GLJgk
         VOofPxPywXm6CSqhUrEQvHLrp285s9jh3+bJBYts9EQVq7EeKgSg9Xq4vWjKYfPdup
         TJTxSAySn/HaSlF6aQFifNCP1fz5t3OFkc0xUQXkJA31kCYuj4A8+hegcN1Fhrr0nT
         3YvGqkq8Mi3Sw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/07/2019 13:52, Dmitry Osipenko wrote:
> 09.07.2019 15:45, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi,
>>
>> On Fri, Jul 05, 2019 at 07:54:47PM +0300, Dmitry Osipenko wrote:
>>> 17.06.2019 17:51, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> From: Maxime Ripard <maxime.ripard@free-electrons.com>
>>>>
>>>> Rewrite the command line parser in order to get away from the state ma=
chine
>>>> parsing the video mode lines.
>>>>
>>>> Hopefully, this will allow to extend it more easily to support named m=
odes
>>>> and / or properties set directly on the command line.
>>>>
>>>> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_modes.c | 325 +++++++++++++++++++++++------------=
--
>>>>  1 file changed, 210 insertions(+), 115 deletions(-)
>>>
>>> I have a Tegra device that uses a stock android bootloader which
>>> passes "video=3Dtegrafb" in the kernels cmdline. That wasn't a problem
>>> before this patch, but now Tegra DRM driver fails to probe because
>>> the mode is 0x0:0 and hence framebuffer allocation fails. Is it a
>>> legit regression that should be fixed in upstream?
>>
>> Thierry indeed reported that issue, but the discussion pretty much
>> stalled since then.

Yes Thierry is currently out and hence has not responded. I had been
planning to look at this this week and responded.

> Sorry, this doesn't answer my question. Where it was reported?

Same thread [0]. Dmitry, are you able to respond to Maxime's response to
Thierry?

Cheers
Jon

[0] https://patchwork.kernel.org/patch/10999393/

--=20
nvpublic
