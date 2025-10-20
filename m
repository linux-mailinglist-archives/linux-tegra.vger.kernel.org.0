Return-Path: <linux-tegra+bounces-9913-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4ACBF30B2
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Oct 2025 20:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED4448028E
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Oct 2025 18:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1E52D47F6;
	Mon, 20 Oct 2025 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIzWjg9g"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A512D4B4B
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986430; cv=none; b=RZfqRvmftVwZQVx10C9QyHUr6NUBMO3yppbn2DFgAiUB3G3/CmppQSzFVfxZ/JC7CocC0KU6rY0RBbaW4dCkda9xgl7XJ+7rPTl32gnMUfgTMWyLnAeEVXUKQU37mx/895f/vZZfjWiTDZAq2DoKw/Zdw5tyy9yTJeNzlBS8l2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986430; c=relaxed/simple;
	bh=ep9oGRp0oF+oCFDHArxdHwQE5BacfqsLXNq7hLcEyno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YB0z/rk4u/KaXe94ASvwPZvYbiWgGhcHFFFf+zYKoss+Ru/XpXutWJR32RU57uCfSBxvXPESLl6lt6JaW8lSlos+fXBjHe+j1dKHqCP51T4f+Jat2OD1Wt0gw2cG/1smFe+PpoYDrLIPO1Kfv131fmhXjebK74WXmZYjFV28T3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIzWjg9g; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a59124323so4846489e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 11:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760986427; x=1761591227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvkRm+XTrLJJZVcVghGvmjpr/0j+IP7YtKfaztr+Qdc=;
        b=DIzWjg9gnQnUG9TcemQgQYlJC55i8rgv3s+7i2MxRtYySa9ILCW7fpRp9+J2yWIUEl
         viFqIMc25uHKqE43zhQ2Qr2hAW7gVMoVl98xyP7YerEPBKHs4claLxW18eJl+NreoJej
         WffmX3v9GA7My0V+8IfhPBc8dGhJ7ua17YO5gpnpjBL3NuSe8BOAKoHqVqdfywjpmbaF
         V+NwuuKz4KqToNNYnna2QJtySN0ULEyzfCdRYcwssMitclS8mmxPy5YJdXCiYEFsOeib
         BiQIBJ1dDXo4RWYkETf2/Dv5QVUmC5rJp9xAu+ogGX4V0Yzng765/M9+UZU0QAu8v9hI
         88vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760986427; x=1761591227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvkRm+XTrLJJZVcVghGvmjpr/0j+IP7YtKfaztr+Qdc=;
        b=qElo50780v54SYSypcESgIQiI/rDGOh0EBSKcQeLiOIjVkyHLcpJ2JBKLunhX6owbr
         mrOvyga1usv3UM0XuiHtCHzAGo1zd5KbT9T9CXtwm3l1ZPiWoAhC8TkOeSxsTlBBLeNZ
         geFzoxFOJq55FJvicigyn0cgpsR6UOGYBGq/txFQ+rv7tCc6QpvZo0T3Oc+b4MLYYtI1
         yki8WnzQldu/IylPErenJPY784SRmByjV1eCu8caEEG2Ob3D8MGfftGN4nivDiS5QcZz
         NbKZpZn9RMRVts69bFeJDemtkmcaXh7ji/w0pXuJjPTo65pEF//yD9QiqSpK+QOY3WXw
         qQVA==
X-Forwarded-Encrypted: i=1; AJvYcCX0G/fJEkhtQDP9lpqlj7vKLLa/AD/ULDThVRKBLwp0bDBXQgcBYl5/Uaue9OdGl2j8JsVd5N0jgpFXnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFlrbnAhQhFmDqLYOJY4OxMZ2p3g0VwDBLuV16N4KPA/sYh3Vf
	W9JZCILel8M3kkOXrIcd/Ok6KE2+2I1/hBo7WFgdLGQXSkj7CwwEKdxHK7vK2kMyvjwCjhc/+XV
	xgndjF3tVebpMHwJJZ8Jb5U+j4hvTs2g=
X-Gm-Gg: ASbGncsIwVPqzz1qa3K9l+nTkyscvt8Zr3ZtGsCZek1No0++8e/YAxY/OYH3HMfy2E7
	BdQcY3rmWRnQcFHddFuSF3pU9cHwUXUqTVbX8B/PUpPQhw70hpquGf2Ywy+a31QtAKdkpPSbqmD
	hnuePFmmNotbHCFO8qEBX7/1MbWbVOWHKfqgzfHzcksX6zzXpseSZVv1uIi6XhfG/dkEbQ1B0dS
	5u8qxOmwV7SpFvPuXcjmjT6YBYBlLGhN1sCusdcIGbf2y+L6/HuNvsbe9u8
X-Google-Smtp-Source: AGHT+IGriJ7UXZ9nd8XnOsNbi6d9VsXWG8HB0uHqueF027XCSb3Vwq82mSdbbfih1n1Eq8I/zX/Vvg6RGc3tBqBeAaA=
X-Received: by 2002:a05:6512:308d:b0:577:318a:a1c6 with SMTP id
 2adb3069b0e04-591d84f7185mr4042715e87.23.1760986426759; Mon, 20 Oct 2025
 11:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731-pci-tegra-module-v7-2-cad4b088b8fb@gmail.com> <20250926212519.GA2268653@bhelgaas>
In-Reply-To: <20250926212519.GA2268653@bhelgaas>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 20 Oct 2025 13:53:35 -0500
X-Gm-Features: AS18NWCmMUTtQXUaLifQrSGp8qDRYM75-V9Y9cQ9D8p5t478TikwLfPuNlOWrnU
Message-ID: <CALHNRZ-1sLDz7rSO97tWFeRzgP4rGo=winc7ZsANtAtQkU+pFw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] cpuidle: tegra: Export tegra_cpuidle_pcie_irqs_in_use
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 4:25=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> [cc->to: Rafael, Daniel, any feedback or ack?  Would like to resolve
> this (part of Aaron's series at
> https://lore.kernel.org/r/20250731-pci-tegra-module-v7-0-cad4b088b8fb@gma=
il.com)]
>
> On Thu, Jul 31, 2025 at 04:59:25PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Add export for tegra_cpuidle_pcie_irqs_in_use() so that drivers like
> > pci-tegra can be loaded as a module.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/cpuidle/cpuidle-tegra.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-=
tegra.c
> > index b203a93deac5f378572be90e22c73e7417adb99e..aca907a62bb5de4ee4c71c1=
900eacedd4b90bc0a 100644
> > --- a/drivers/cpuidle/cpuidle-tegra.c
> > +++ b/drivers/cpuidle/cpuidle-tegra.c
> > @@ -336,6 +336,7 @@ void tegra_cpuidle_pcie_irqs_in_use(void)
> >       pr_info("disabling CC6 state, since PCIe IRQs are in use\n");
> >       tegra_cpuidle_disable_state(TEGRA_CC6);
> >  }
> > +EXPORT_SYMBOL_GPL(tegra_cpuidle_pcie_irqs_in_use);
>
> tegra_cpuidle_pcie_irqs_in_use() looks like a workaround for a Tegra20
> hardware defect, and having no knowledge of typical Tegra20 systems,
> my questions would be "Why do we even bother with this?  Should
> cpuidle-tegra.c just disable CC6 always, unconditionally?  The whole
> thing, and all of include/soc/tegra/cpuidle.h, looks like it might be
> more trouble than it's worth."

It's been almost a month again with no responses. Does this have any
path forward that doesn't include signoff from the cpuidle
maintainers? It's been over four months since they were first asked to
look at this, so I presume there will never be any response.

Aaron

