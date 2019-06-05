Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF3C35D71
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbfFENEp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 09:04:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33231 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727744AbfFENEp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 09:04:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id n9so6953299wru.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lAKBlOxlAH9WcvbsBPb/zMFiOJhs5Y0DjvXcIr6sgOc=;
        b=Fi81MJ26VtstSELgcDAOY8S7jjbLdELT2Eh6O8M+JOGfnbs0Aevja24PQVlgYK1DwV
         SqRv3dokc6Se3y7KcNoViZxEdLP+HVxy2bxvE4p9jxjLLLf1FNTfQYuaZ5bVnomv5wYH
         V6PTIrqRMGoBFApuJzG7twHkkpGbDQHTraidcRdZuTmP3bayixvLkZBLFIu2xVMJ9BtE
         CHxVL5DUXqee+poRyZEV8+wDu1/3I8rWuSatV0cSP/DoveX5kWDuXQYKXlSILe25Aw+m
         L1aEwuoB5zZyvszGjN2rC3gPMzKdaD2Xg5SWd3i6E/5GKPVJf/OKP7TRNy9C0InTKxOP
         HLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lAKBlOxlAH9WcvbsBPb/zMFiOJhs5Y0DjvXcIr6sgOc=;
        b=CGoZ9s6iNam5pen4NTojijQ1XLZhdvucqIc4KzaHqGpOLTq5VjvCvvWOGk/Z2jVULd
         SFwOGDYuaaEu9i3PWcJybYyWk7a+Nv+mCq/D/CxOPR7Byvvu1hKShr7n2bThl7sukxi6
         QEKV2oaCE+QO4OGKIGd3kaQwH7NBc6Qcc4gwBRhOvmYLz7XBxAV7Y7D3zcCdARmWqCWK
         NPyIKvu1v6Zg0990JJphOzqDvCnE3ozWKA/099TLbvmrv/9a2gqxOWOuljcRs2SP69U1
         1z4iUw3KY0jlU+guk50n65MGdrCC6J9gYDGbwAItT71jcxugClTTvePjgaqaVrXf2bn7
         XZMA==
X-Gm-Message-State: APjAAAXPS/eGBjioG6grfW0Mcfic5NYtKIYX6H2IM/pxyfFhd9UVEWKq
        ABB4Rnb3F3EbxlaqMbTMaRU=
X-Google-Smtp-Source: APXvYqw5fihAiwZA2gzf4WmfhckYWDdRa+S9nj1ItPIhxigIU+y49G6EKapnmKalES1MO7rywQos5w==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr24577798wrr.287.1559739883302;
        Wed, 05 Jun 2019 06:04:43 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d2sm15434184wmb.9.2019.06.05.06.04.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 06:04:42 -0700 (PDT)
Date:   Wed, 5 Jun 2019 15:04:41 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
Message-ID: <20190605130441.GB1012@ulmo>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
 <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
 <20190605082848.GB10944@ulmo>
 <1654b4cb-930c-dbc7-b40d-1f854ff2ac69@gmail.com>
 <20190605123226.GA724@ulmo>
 <60f6e811-e4de-7bc6-fc9d-53a8bb8aff53@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <60f6e811-e4de-7bc6-fc9d-53a8bb8aff53@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 03:40:28PM +0300, Dmitry Osipenko wrote:
> 05.06.2019 15:32, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Jun 05, 2019 at 02:25:43PM +0300, Dmitry Osipenko wrote:
> >> 05.06.2019 11:28, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Tue, Jun 04, 2019 at 07:07:42PM +0300, Dmitry Osipenko wrote:
> >>>> 04.06.2019 18:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> When deferring probe, avoid logging a confusing error message. Whil=
e at
> >>>>> it, make the error message more informational.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>> ---
> >>>>>  drivers/gpu/host1x/dev.c | 5 ++++-
> >>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> >>>>> index c55e2d634887..5a3f797240d4 100644
> >>>>> --- a/drivers/gpu/host1x/dev.c
> >>>>> +++ b/drivers/gpu/host1x/dev.c
> >>>>> @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device=
 *pdev)
> >>>>> =20
> >>>>>  	host->clk =3D devm_clk_get(&pdev->dev, NULL);
> >>>>>  	if (IS_ERR(host->clk)) {
> >>>>> -		dev_err(&pdev->dev, "failed to get clock\n");
> >>>>>  		err =3D PTR_ERR(host->clk);
> >>>>> +
> >>>>> +		if (err !=3D -EPROBE_DEFER)
> >>>>> +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
> >>>>> +
> >>>>>  		return err;
> >>>>>  	}
> >>>>
> >>>> The clock driver should be available at the time of host1x's probing=
 on
> >>>> all Tegra's because it is one of essential core drivers that become
> >>>> available early during boot.
> >>>
> >>> That's the currently baked-in assumption. However, there can be any
> >>> number of reasons for why the clocks may not show up as early as
> >>> expected, as evidenced in the case of Tegra186.
> >>>
> >>>> I guess you're making this change for T186, is it because the BPMP
> >>>> driver's probe getting deferred? If yes, won't it be possible to fix=
 the
> >>>> defer of the clock driver instead of making such changes in the affe=
cted
> >>>> drivers?
> >>>
> >>> The reason why this is now happening on Tegra186 is because the BPMP =
is
> >>> bound to an IOMMU to avoid getting faults from the new no-bypass poli=
cy
> >>> that the ARM SMMU driver is implementing as of v5.2-rc1.
> >>>
> >>> As a result of binding to an IOMMU, the first probe of the BPMP driver
> >>> will get deferred, so any driver trying to request a clock after that
> >>> and before BPMP gets probed successfully the next time, any clk_get()
> >>> calls will fail with -EPROBE_DEFER.
> >>>
> >>> This is a bit unfortunate, but like I said, these kinds of things can
> >>> happen, and probe deferral was designed specifically to deal with that
> >>> kind of situation so that we wouldn't have to rely on all of these
> >>> built-in assumptions that occasionally break.
> >>>
> >>> The driver also already handles deferred probe properly. The only thi=
ng
> >>> that this patch really changes is to no longer consider -EPROBE_DEFER=
 an
> >>> error. It's in fact a pretty common situation in many drivers and sho=
uld
> >>> not warrant a kernel log message.
> >>
> >> You're trying to mask symptoms instead of curing the decease and it lo=
oks
> >> like the decease could be cured.
> >=20
> > There's nothing here to cure. -EPROBE_DEFER was designed specifically to
> > avoid having to play these kinds of games with initcall levels.
> >=20
> > What this patch tries to do is just to avoid printing an error message
> > for something that is not an error. -EPROBE_DEFER is totally expected to
> > happen, it's normal, it's not something that we should bother users with
> > because things end up sorting themselves out in the end.
> >=20
> >> Won't something like this work for you?
> >=20
> > I'm sure we could find a number of ways to fix this. But there's no need
> > to fix this because it's not broken. What is broken is that we output an
> > error message when this happens and make an elephant out of a fly.
>=20
> Sure, this is absolutely not critical and deferred probe is doing its job.
> But don't you agree that it's better to fix the root of the annoyance once
> and for all?

=46rom my point of view deferred probe is the once and for all fix. Back
before we had deferred probe, doing these kinds of initcall reordering
tricks was fairly common and while such a change may fix one setup, it
often ended up breaking others.

Sorry, this is a lesson that we already learned a couple of years ago,
no need to rehash it.

Thierry

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3veUACgkQ3SOs138+
s6Hh+w//eO5keGAMTV4qZAt72d2BjYxR7OOAwcU80WLg3bR6MBQBnV4NZLLwlB8+
C87QuKUrGah4F7JeqJ5ZSmcFyGMMk1mClRyE0D4fGuCq7UtTz9bbrBQEPlpdNx+c
ZEzu5rklNdq9a4noJsJi4e6z1AIxXlATZM1ALGjw+8WPZXLC7m/GFotTwTHSXJQK
UusdJIVpMTeVdLwBmqjLi72rmJHGP8nR3sMd7YRMeyO8MUdFr+tnSioQnLLLdLSM
xQlwxqV1n6TLUXetLLA3fHUzuq1nlfxOG/450gdqf4S9Zcr/uRXOs9atWX48E7R7
Hx3LuJTFlo0WuwtLgH1GxSUB0cLySVPMb0GXk25/jgjndC6sHjqtix4UxTAnkpO9
Bz9V/6/KnTZ8hJ7M/5I5HB/cy6Ao1YTQOWFfp8Bc4XIbQKYDxml6UQ2fUhPMsX9/
/ci9I1xeZI85zjp+qA1/TCjpjVbvuZKwzouS6YfgL6sEZ8PD7KzqhDaklKH3NeGX
+EdygSWSPTV0pCUkhFNCR/2XVFnrgU8w3WVxyCdYAtXaj7EU8/UiAnUQ16MKJXky
INAo4mEY0cTr3gm7dRWBmq5MSGlm2fGqlyw2duZkjytcq2dvpiyaMYLMmus3JSO5
LI76ZrmOQlAgpNedCWtDS/1XyM6VEMnVmhr+rdFM4PLTn5D6TgU=
=PAYe
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
