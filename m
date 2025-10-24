Return-Path: <linux-tegra+bounces-10038-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC6C0478C
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Oct 2025 08:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0BED3B22A3
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Oct 2025 06:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14E226E6F2;
	Fri, 24 Oct 2025 06:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M33umFR/"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E886726656F
	for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 06:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286640; cv=none; b=EzCmLNU8TCKHL5CYMyJBnZ2TpTSqACvroZTSl6HEXkvyftPFU5HsF32iZEuhABIZINriuYZ+P2MDScUGyKFKL1f/oFRHhAJpsHOyAUgnYcc0H7JL5qTgePEAia4YG8cxiIu9qCA3WbAXlzrWq8UpmJLK7wpigmEkdLsfhEooupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286640; c=relaxed/simple;
	bh=56hNuT/xUKtLWXLBHxCtWU4pY9tz9h+vffMnxjNaQR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU94PKzzIhvEYD86G85Tc8ZK3l8kJKqpF7pVObLCzjEBTw4StX/g23dlgY7tX6/tiShi2tmEC0LRJDy5dZF8X7Fu9o8cec0kGF5zbfpokJY9P3w1egU4bb7qCfM6t4st6dpzsKS/HZLRApeEtkEnFXJVgmAQBxczeKUX8B8MNhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M33umFR/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3c2db014easo367326866b.0
        for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 23:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761286637; x=1761891437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvQDWtdQ2sodUGWH+64s7RFvD8lI9WBRcaVgkVNkp50=;
        b=M33umFR/y6xIzhgcuH8h+3PJFMMjy8ZqC6BFCKznEezK/A4UXcd3ylhbTEc/fszt4O
         BNq2kYrUWMqWDFmnuYW4ZlbgtrH0Vv1q+IU28pAo2Be3VeTxziZYDLEqocG+IDeY4xsJ
         BQDk0QIEeb5yuw4NmvHK7rCr8Dw6Qc5BNBkNuzazeztERqXJ5C5IS7XhBxxB5H8bq+HI
         ya5yWfESOYqUI/oBQs0mzIkrJTsDv+A7XW3b+eZ62qPfhTnIUi5ZIXXT0sOJu7WfbfI2
         FCRTuCgdfvEu6wGIzTq2zcb5e9rpp9VYAS5TIelib8Ie3HJ7ESspKHe1b9qvsVybqUIL
         3H2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286637; x=1761891437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvQDWtdQ2sodUGWH+64s7RFvD8lI9WBRcaVgkVNkp50=;
        b=rFrncph2RZ8EnTIilyCJqdhc02HgvuqwzVrp1Jpzc9JWjvkrvCcpJr3MTtWrJeJOxT
         pGiKh4cdkB+gyg1SSyuLmrW7wDlodcn97kujBYXOMFbWwfbz6R8X+FvhugORfqmU+TXT
         yUWG5tPgrxeYnlImW/l6uXS/KtMpqeHCfCWG8pIEj4w6sErwOOfw5Q0S7EjWriJKfuVu
         pE/nlCyaFGSwfCxtMwNSE9/s9LvwAoWpr63J7nfitls9/hwMa82WY30KVDnrDq1qJ7Tr
         xOawmGHNmUMGiITot873h8cjEkO3fPBcVaIV1ocmSCKhg5WLXpEKh1hhAliWdVRWhDp6
         Q8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3d2UCdArNXjVqaSkG7tkUL5SO0vu7uPn73pRldEuO+wEVQvhfkPnNiu++Yax1tQJWJGNkfHJ8Q5jFaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+WCohnPWSeSf0IuKTChditB22GuEmTxIqmxPV4u5dmSLNOIQ
	+GzWBUNOEYMKE5cd9d/MwpTOgNEGBxUNwlwXdic30lpwUnMG8nqytVCL4ewaJkSFovUQS6rSWHx
	SKUf1BDJrRe6okkWJuBSa+DW6h7/NIWA=
X-Gm-Gg: ASbGncvsq69E5M8zG3IiOCcO+6boer23RNiG6Dh6hwMJSXGO+MUmpGoRNsM9/ExgJcs
	B8ld2QMfXI7/Ci7qTkThknpHrKnXWOHqrBPmJaTVK+XvvNnJReKqGGVDOSA1p6SQwENJVRh2Xji
	m6RZLH0Q+1PjfOtxn1xz96lP2RRjPJhP1e4tPIS0GV5aTpwrAqxwgRtlEOO5LK/GurqwCh+RmQE
	OhxbxIhrJaeJbsoSbXYu8qDSizgF5aBAkdDf2ehmq9KelEL7iR5Vrd4hb+sbVMpJQ6JVg==
X-Google-Smtp-Source: AGHT+IEYzJae7VoT/c7FHoFZ2w1f+vGPYbQGnE984l0qzu5gM1i4HI97k5jQZaiikEMv2TwzZxE5MWhZESWWNIE+YQ8=
X-Received: by 2002:a17:907:1c1e:b0:b2b:59b5:ae38 with SMTP id
 a640c23a62f3a-b6d51bfb0e1mr629125966b.40.1761286636888; Thu, 23 Oct 2025
 23:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926072905.126737-1-linux.amoon@gmail.com>
 <20250926072905.126737-4-linux.amoon@gmail.com> <ose3ww7me26byqwsyk33tipylkx3kolnc3mjwrlmjwsmza2zf3@os7lkt4svaqi>
 <CANAwSgT0VRFFpKv3saJTAA99oGoAHhP+bx6Xe-QGf5b4Dgik=A@mail.gmail.com> <6eqqafz2dojo533fw2j7say3p37simug5bol2s5dvcpac77jzb@2x22ekyl4qdq>
In-Reply-To: <6eqqafz2dojo533fw2j7say3p37simug5bol2s5dvcpac77jzb@2x22ekyl4qdq>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 24 Oct 2025 11:47:02 +0530
X-Gm-Features: AS18NWB79LzUXZfNM_Vk4QnYlquHYcZbCYFtcNRut2QcVzty8nJpzlwr2rljOfc
Message-ID: <CANAwSgSeOrVjkuFbPKAPXDnCrsApcgePEs3D6MWwtsu9nYNesw@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] PCI: tegra: Use readl_poll_timeout() for link
 status polling
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manivannan,

On Tue, 21 Oct 2025 at 07:13, Manivannan Sadhasivam <mani@kernel.org> wrote=
:
>
> On Mon, Oct 20, 2025 at 05:47:15PM +0530, Anand Moon wrote:
> > Hi Manivannan,
> >
> > Thanks for your review comment.
> >
> > On Sun, 19 Oct 2025 at 13:20, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
> > >
> > > On Fri, Sep 26, 2025 at 12:57:44PM +0530, Anand Moon wrote:
> > > > Replace the manual `do-while` polling loops with the readl_poll_tim=
eout()
> > > > helper when checking the link DL_UP and DL_LINK_ACTIVE status bits
> > > > during link bring-up. This simplifies the code by removing the open=
-coded
> > > > timeout logic in favor of the standard, more robust iopoll framewor=
k.
> > > > The change improves readability and reduces code duplication.
> > > >
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v1: dropped the include  <linux/iopoll.h> header file.
> > > > ---
> > > >  drivers/pci/controller/pci-tegra.c | 37 +++++++++++---------------=
----
> > > >  1 file changed, 14 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/contr=
oller/pci-tegra.c
> > > > index 07a61d902eae..b0056818a203 100644
> > > > --- a/drivers/pci/controller/pci-tegra.c
> > > > +++ b/drivers/pci/controller/pci-tegra.c
> > > > @@ -2169,37 +2169,28 @@ static bool tegra_pcie_port_check_link(stru=
ct tegra_pcie_port *port)
> > > >       value |=3D RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT;
> > > >       writel(value, port->base + RP_PRIV_MISC);
> > > >
> > > > -     do {
> > > > -             unsigned int timeout =3D TEGRA_PCIE_LINKUP_TIMEOUT;
> > > > +     while (retries--) {
> > > > +             int err;
> > > >
> > > > -             do {
> > > > -                     value =3D readl(port->base + RP_VEND_XP);
> > > > -
> > > > -                     if (value & RP_VEND_XP_DL_UP)
> > > > -                             break;
> > > > -
> > > > -                     usleep_range(1000, 2000);
> > > > -             } while (--timeout);
> > > > -
> > > > -             if (!timeout) {
> > > > +             err =3D readl_poll_timeout(port->base + RP_VEND_XP, v=
alue,
> > > > +                                      value & RP_VEND_XP_DL_UP,
> > > > +                                      1000,
> > >
> > > The delay between the iterations had range of (1000, 2000), now it wi=
ll become
> > > (250, 1000). How can you ensure that this delay is sufficient?
> > >
> > I asked if the timeout should be increased for the loops, but Mikko
> > Perttunen said that 200ms delay is fine.
> >
>
> readl_poll_timeout() internally uses usleep_range(), which transforms the=
 1000us
> delay into, usleep_range(251, 1000). So the delay *could* theoretically b=
e 251us
> * 200 =3D ~50ms.
>
> So I doubt it will be sifficient, as from the old code, it looks like the
> hardware could take around 200ms to complete link up.
>
Instead of implementing a busy-waiting while loop with udelay, a more
efficient and responsive approach is to use the readl_poll_timeout()
function. This function periodically polls a memory-mapped address, waiting
for a condition to be met or for a specified timeout to occur.

If there are any issues with HW, we could extend the timeout to compensate.
> - Mani
Thanks
-Anand
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

