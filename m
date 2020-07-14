Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD3321EB6B
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 10:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgGNIcI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jul 2020 04:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgGNIcI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jul 2020 04:32:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E187BC061755
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2020 01:32:07 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p20so20614324ejd.13
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2020 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EKHKh37sykf/7clJqWa8WaluzzsDWQI5DWMmtgZgFv4=;
        b=gfGALNvCqO5gDZ7YA/7Twy/wMJat7cja6obERaqt4MYU3Q3Vpgl4Zlj2msWzTndt8E
         j6k8qVFxCc8cSz7AiTikZv/Lg3wm3yAnc5KPXsiObNHUeRKzB65AgMW2Uk9ORUMYOfGa
         GnAZVtkUjO8WRaeenT7XAQ6FJeZKcNhaM2s7Zo88zMX8ehjAbwqUo4NxIqWMwkULoSSx
         tFeE7Hs2EHOwmtd4AeCUP8DEH4NIXjduytlKMSxGd0OmHnBcsL18gTlW53GkUD3FrSN/
         o3yUQMQPUbR0UUcG8Nvozfw5mryv7HJcjVyY+Rl7FLn7wJj5JPgG/3W31i/lWYhC2Dlo
         WEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EKHKh37sykf/7clJqWa8WaluzzsDWQI5DWMmtgZgFv4=;
        b=Jc6BYn0ioVRoAFWd2eNwqRTvMGTf/us/oFs62mIrP7q7uBR5gtlyJniEj+PwPcluHu
         L+CH2kVLlUpEe7ITwDqbHFmfr+tbrKdEGv2Dx85EKyyA2vailZ8tUSdeIBvhZxBh3sJ8
         loU9cK6Ub7HpnAha/I0VoFGsI2Fj40aHe7mOBcmvy3D8knSZF6RuBGfgNdgAJRajXapD
         FK9RqFCcom6JCgMp4/NQGEL7GqWV5ryelWRqbYmekWADN8Wum1MOHvoekEAey/SDpAD2
         Gn7DkC8yE8bok31AnE4RLmf0cLQD5eM1i/7U4Fg2VZ8allQ+Qpj5S12E7LxSJWPCu5l7
         aiQA==
X-Gm-Message-State: AOAM532wLP3z5A6jv6OwGqzEbckvPrDXY+rrWj/kO7G7sjevk+7hkkTF
        tCIXiVGlWsqftwAO3PLzTfg=
X-Google-Smtp-Source: ABdhPJzoT8clCwMJIXPwnv+XWZJjnmKOXyjjLxXnxs2fruknDArtszhygGXbtFaYqsDpjgTM08lyOA==
X-Received: by 2002:a17:906:d217:: with SMTP id w23mr3615185ejz.292.1594715526662;
        Tue, 14 Jul 2020 01:32:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n9sm14166680edr.46.2020.07.14.01.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 01:32:05 -0700 (PDT)
Date:   Tue, 14 Jul 2020 10:32:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RESEND PATCH] ARM: tegra: Enable CPUFREQ userspace governor
Message-ID: <20200714083204.GA141356@ulmo>
References: <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
 <20200713144134.24444-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20200713144134.24444-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2020 at 03:41:34PM +0100, Jon Hunter wrote:
> Enable the CPUFREQ userspace governor in the tegra_defconfig so that
> we can test CPUFREQ with the userspace governor with this configuration
> on 32-bit Tegra devices.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm/configs/tegra_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NbX8ACgkQ3SOs138+
s6HISg/+JuiFw9nGbsOP/irKv8Vx0dMGLWMDijFAkC0sXWgaR5PUdV4FWNwteZ7X
ufigQ6FZaWrjvR+o3AnrJ8GmKvJHogiD2vPKyMrODti3d3wbl66AzLhsY0LLvCb9
+tqYZ4/Pvc2B9Sx6IvseaxUyAyAUwcBdZbEkeRW0UDS6fKaTsSEWKOxohWujgvEA
zFvCFn/drOtx24D+bD87bNVlEdo9tvBr+U7X6CIsx2AI+a8cV486Ts43u4oZx0OM
NzLO/UohuyDq946ad7kglhvQ4wBdJWTzxwYRQzjo86bR+v/2qeR+87C3ZVNNB3Eu
EJ/Xg4ZCxIgZYdhOWC9jD4v3uDFRU6mmEDiehTk88Qu4oDB/gbhw+FL2SX+zfmo1
y8hq6qI1qf9L9HBs21nm3d6JM4iiyGgNxNXpWKWmTEqOTM0vE+BgO2W+Uqcu9AFf
k118RdGjNG19vuZO9LgZ+MG3zDPCLH6qAbP1Xmsv/mDWab+4Pb0uUEqjbHa3VeqA
od+MBm/GRZWyOxmJCnqPdQ7h5Avbr/aB5pvlFF2p85dyAmaYQoon5wkDm+1x7mnr
gcUex+EFaIdEHgFZor08R3J1ENf9awUYYcc5E0/aKE/kqyEJ5EUlxGCaCg5Yv+m9
wZnK8uxgqlr44S6GUzqgKuH8eJYdFWCO792kdULuoS6vRk+TfAw=
=nczi
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
