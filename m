Return-Path: <linux-tegra+bounces-9415-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A6B92312
	for <lists+linux-tegra@lfdr.de>; Mon, 22 Sep 2025 18:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75EDA1903CC5
	for <lists+linux-tegra@lfdr.de>; Mon, 22 Sep 2025 16:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FDE311C14;
	Mon, 22 Sep 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+y0W5jr"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048853112BB
	for <linux-tegra@vger.kernel.org>; Mon, 22 Sep 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557917; cv=none; b=MFMfzscUWq00+dfOBg+ofU7k6+yPKL51SIkIhuOe8YTwDjLWE6DaXqhUu25tI8F59Z8UTbvP+6Sz/b0Bf+1l2Pmq+5gosiTHWpEOuKetRq7UcHFgzR5o5ddOoIvj5KluvkUfRzJTl0iY71IX3ZCozYy7dNsK/6PfTLeSWKQGfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557917; c=relaxed/simple;
	bh=/6cwwyx95yFe2VTI7rjAQhARkqn7dtwQ1pD0HDEwEf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHXSve1HZxdzGBbEWgGiUkiucAcT1qUQYYA7OTqkWQqeIPf02Twt5NA8HP3h8+EbxaO7TvaHK+s5CeMjkQfzo6dGjNFC7x6vSmxW7rW3c32+ye/rwacFslDawRV4wtVvIWaNmodd6vN/+dq4ZMDp+coem4T2Z/8C/W7t4PdJlVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+y0W5jr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-579e9fd5474so3940588e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 22 Sep 2025 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758557913; x=1759162713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWRtWQb4tDxw+RDTltwl4oqgAah0j63IckQcO9ISpds=;
        b=B+y0W5jrON3vUgE9gMEjzzqgeI4CAYy4nBbbY2kwy2f/A4ITKm4642WsSqHc1IOO7e
         kCfaNepv0TA2wrq50eHN8JORs97F/CWkyN80iYj0zTvTtfFFw80J1JcpskcK9rjvLBnw
         ZfnqfoBg1IOxhV+nznb386tOUfe0nDG4tTkxWU3Kq8rsEI4WvT6CVftMsqtvitG4CnM+
         3u4mhK16x0Z4Ltlk8nRYp9OngR9AqX0OglLpLql1cGh+R2IhXef2PBUbBYB+1jLflowd
         44wWRm9omEbwWDF08trX2f4sJnETtd7KirofR85e6rEMxxl0XCKJNbS+Qiavt+5hlYJa
         rcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557913; x=1759162713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWRtWQb4tDxw+RDTltwl4oqgAah0j63IckQcO9ISpds=;
        b=diUNtxn/BBnMXDoWJUzxp1itZ9aJIIZJquLmMrqvkanpTnCm+NujE1oKVPQcMf+azp
         w/Su1TwDOZ6zWTWwR8WKyJ9Bn6h8LrB7stmNHvbrkqOHWU4iIZzrvyvjgrz9CTZfgxYJ
         oPwhPjsuQjIsd8ov/KFLhW+73nXdLA0uVWWB0sWsC8l0iI7RQ328yDdwomVkJDCanRZj
         Xi4ATL5SzhmML2dzlBOS9A0DNNJVnAOK8SqJtAVsJWT8FBP/CSHE43ScLF2M3K4bHSnm
         wjgeXRvyqme3jN1d4IjBIhIr2KWvfNY6MfRmHIx6jlMFNmCwCfpE4YrBSg29D45o3DrM
         HVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDc1TsTnBYktImQ6gRa6EOABQBh+/69j/S0x1L+8aErCSWrtcVuKcxIiFQ5WXGEANHvd6c7j11RWimlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UU1CaaivwWA50R2u8lgAJasHal7Da4k/Vtd8JgS/DdO7EZgY
	hlo0GlqCEPByBgzVsvGqhWLsLPZ5XpeDhk5qH8/sDKpn335DAqAXxt5Efiqsf24y8b9GdigT8HU
	RRb9qoI86K3PfF28Muw15/QU0R/OfPpAGzQ==
X-Gm-Gg: ASbGncuHObMY0ioHKH3eY/Xclg6za2RcMLpq4ugciSHxlwvEPPiCirFawuIhiNpDF2z
	0fHHGQx59i3YqPt00RemIgdnW1hA/+sGFa9VS7cI8zIaWijhyaC1YZKm4L981ZnAfYZPld7IViD
	9Bjs52xU/aX148CLUuDtm2HO3jNZdwsvb6uRMmAOZJ9yrDpuSYr3cHalJtf2YbHKJ2o/AxnUiXL
	+NoKTk=
X-Google-Smtp-Source: AGHT+IHbkCgbJFbDcK840KctNsVPKayfAg5z4hva0W8zSa5d3VGIBMvbwMO4roIb9UisDL440+gagdm9md1t8goV1+E=
X-Received: by 2002:a05:6512:4504:b0:57d:d62e:b1fe with SMTP id
 2adb3069b0e04-57dd62eb499mr1348510e87.10.1758557912953; Mon, 22 Sep 2025
 09:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731-pci-tegra-module-v7-0-cad4b088b8fb@gmail.com>
 <CALHNRZ9tOJccZ5sQjvkoPe4-+VUtWRxAzAOUainGUCs4+_RBCw@mail.gmail.com>
 <omchhpbmsydfcsm6mzmbdiupsrxmxxvkxqf33fgi563akn76vf@vkc7k2zhlvee> <CALHNRZ8PZzseaTSCvhM6o7jMVYtVdHTczurXh1q+DY5MG62+DA@mail.gmail.com>
In-Reply-To: <CALHNRZ8PZzseaTSCvhM6o7jMVYtVdHTczurXh1q+DY5MG62+DA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 22 Sep 2025 11:18:21 -0500
X-Gm-Features: AS18NWCkrA0Swv5I_sKNAMQ_VfnE8PJr0_nR10ONiX1dW-00lBFelqUkDRsus4A
Message-ID: <CALHNRZ8mKZRS=ddyuscoTqu4h8GDR3fM8k36gbjth-csd10GGg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] PCI: tegra: Allow building as a module
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 1:39=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Fri, Aug 1, 2025 at 1:01=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
> >
> > On Thu, Jul 31, 2025 at 05:01:55PM GMT, Aaron Kling wrote:
> > > On Thu, Jul 31, 2025 at 4:59=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > > Changes in v7:
> > > > - Rebased on 6.16
> > > > - Updated mailing address list
> > > > - Link to v6: https://lore.kernel.org/r/20250507-pci-tegra-module-v=
6-0-5fe363eaa302@gmail.com
> > > >
> > > > Changes in v6:
> > > > - Remove unused debugfs cleanup function, as caught by kernel ci
> > > > - Link to v5: https://lore.kernel.org/r/20250505-pci-tegra-module-v=
5-0-827aaac998ba@gmail.com
> > > >
> > > > Changes in v5:
> > > > - Copy commit message exactly word for word on patch 1, as required=
 by reviewer
> > > > - Delete remove callback in patch 3, per request
> > > > - Don't clean up debugfs, per request, which drops patch 4 entirely
> > > > - Link to v4: https://lore.kernel.org/r/20250505-pci-tegra-module-v=
4-0-088b552c4b1a@gmail.com
> > > >
> > > > Changes in v4:
> > > > - Updated commit messages for patches 1 and 2, per review
> > > > - Link to v3: https://lore.kernel.org/r/20250502-pci-tegra-module-v=
3-0-556a49732d70@gmail.com
> > > >
> > > > Changes in v3:
> > > > - Add patch to drop remove callback, per request
> > > > - Link to v2: https://lore.kernel.org/r/20250428-pci-tegra-module-v=
2-0-c11a4b912446@gmail.com
> > > >
> > > > Changes in v2:
> > > > - Add patch to export tegra_cpuidle_pcie_irqs_in_use as required wh=
en
> > > >   building pci-tegra as a module for arm
> > > > - Drop module exit to prevent module unloading, as requested
> > > > - Link to v1: https://lore.kernel.org/r/20250420-pci-tegra-module-v=
1-0-c0a1f831354a@gmail.com
> > > >
> > > > ---
> > > > Aaron Kling (3):
> > > >       irqdomain: Export irq_domain_free_irqs
> > > >       cpuidle: tegra: Export tegra_cpuidle_pcie_irqs_in_use
> > > >       PCI: tegra: Allow building as a module
> > > >
> > > >  drivers/cpuidle/cpuidle-tegra.c    |  1 +
> > > >  drivers/pci/controller/Kconfig     |  2 +-
> > > >  drivers/pci/controller/pci-tegra.c | 35 ++++----------------------=
---------
> > > >  kernel/irq/irqdomain.c             |  1 +
> > > >  4 files changed, 7 insertions(+), 32 deletions(-)
> > > > ---
> > > > base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> > > > change-id: 20250313-pci-tegra-module-7cbd1c5e70af
> > > >
> > > > Best regards,
> > > > --
> > > > Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > >
> > >
> > > Continuing the conversation from the last revision [0]. Is there any
> > > path forward for this series?
> > >
> >
> > Daniel, could you please look into the cpufreq patch?
>
> Another two weeks with no response to a review request. And over two
> months total since the cpuidle maintainers were initially asked to
> look. Is there a policy for dealing with lack of responses?

Another month with no response. Can something be done with this,
please? If the subsystem maintainers don't respond, can they be
overridden by anyone? Who would the next step up even be? Does it go
directly from subsystem maintainers to Torvalds himself?

Aaron

