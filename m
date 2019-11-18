Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A821006BA
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 14:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfKRNoz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 08:44:55 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36157 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRNoz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 08:44:55 -0500
Received: by mail-wr1-f65.google.com with SMTP id r10so19556515wrx.3
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 05:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cBlN/1h/n1C4xNknMXrlM2nqMCgsNCA9mbBICWETfGM=;
        b=EWAmkELza9qd3e3j0aP6pG2OW/RVmw+HtC00qQ1eegqSqJx16UiSrn6bLdKgdKiWI0
         3n5yapOKj/03zOZ1RzRysZIWRFqNikWLYJCvoIuKgEPuJmamx+3CC1eCOEeBoT2alRW+
         KdlN5+ntn9+EUPjAIumZgp7P1f5YcfixT2o/YseLrPHjUyjHWIwZimHJ2RNzGapWJHxM
         ifUHBQnoiM6b8NJol/wVzZXsJTgnJ6bAAA9im+QDecFxhv7pg57IjyRYnFhtieEvf8Ii
         EqM8/Y0bNU3xjECHHTozaRzkZgfz1uJ5bV9QQOOs/3k8FHgjozUoKi0F2IV8I1INc2rl
         ESzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cBlN/1h/n1C4xNknMXrlM2nqMCgsNCA9mbBICWETfGM=;
        b=Kg9FInOZbJ19pSLndogpSde7k/cFWGdQVp1kKQVkj/ok/CVahyvfPXpjEQnbkTWO2q
         +GxEEtPycfvcrQ/Yx7RHBO1aWHvaOZo9fnUE+NR3MdGFNFUlxQ4U6byqheEp1Ps99gky
         2WsQYWKlzVjzRBwm5xMuaxyhXwC2zB1bJNVHcTixYrHhGrA9indDVhOzRpB+cV3HQ18J
         Q2FJp8eHIsFBFmixShsilocBgBwkVzetcsNzxfxpPIkd3FgGOHiigJrW5dTBiLDGShV9
         3ToZVJVwTPA0anPz8cfhMSGh9G8Dnu4JCYhsy8r4/brQNCO/Whjbdzk2OdnhQg66eWEg
         Id/A==
X-Gm-Message-State: APjAAAVnLvCAMP0jW5ueMi4PDIWCMjWZFGFZnY2sQoHKEy0giibf7kFN
        Z2jdwGB19SpA7N8NHMO6KFrF+zhAv7U=
X-Google-Smtp-Source: APXvYqwnquK2v+isw4M56+bea/AVu3mBorW0nFKpuC8zSvWHbMuT7jp415D/N7cw1/hnGLGOKvAp+w==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr29840482wrv.66.1574084692261;
        Mon, 18 Nov 2019 05:44:52 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x8sm22918316wrm.7.2019.11.18.05.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 05:44:50 -0800 (PST)
Date:   Mon, 18 Nov 2019 14:44:49 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
Message-ID: <20191118134449.GG2246533@ulmo>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2019 at 06:56:28PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi Ben,
>=20
> here's a revised subset of the patches I had sent out a couple of weeks
> ago. I've reworked the BAR2 accesses in the way that you had suggested,
> which at least for GP10B turned out to be fairly trivial to do. I have
> not looked in detail at this for GV11B yet, but a cursory look showed
> that BAR2 is accessed in more places, so the equivalent for GV11B might
> be a bit more involved.
>=20
> Other than that, not a lot has changed since then. I've added a couple
> of precursory patches to add IOMMU helper dummies for the case where
> IOMMU is disabled (as suggested by Ben Dooks).
>=20
> Joerg, it'd be great if you could give an Acked-by on those two patches
> so that Ben can pick them both up into the Nouveau tree. Alternatively I
> can put them both into a stable branch and send a pull request to both
> of you. Or yet another alternative would be for Joerg to apply them now
> and Ben to wait for v5.5-rc1 until he picks up the rest. All of those
> work for me.

Hi Joerg, Ben,

do you guys have any further comments on this series? I've got an
updated patch to silence the warning that the kbuild robot flagged, so
if there are no other comments I can send a final v3 of the series.

Thierry

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3SoFEACgkQ3SOs138+
s6H1sw//TEml9ZrPUemKFYIMfOWf6dFC1MUTYzGiajNIxv4J/7FqdNnBqUm6RT1o
uROgL3iqP7fAoEHg5hVhwzRzxAH/bC75nfn9PD+yiPpVOwhqfY3OTwYXyEj3wBld
G+2TQb5RTHd1HAv14IKsw33fyTMM/P22GGkcRfOuzhu3Q6U1hJCBc7zG3VQWSSN6
u8bWNlYl0VZ8KcDlQJpYgT6QYOFYmagQGNkCRgeAgDUUKRE7rQ8vVZ6BOjtYv+SY
5nTKNujyFp1Yoagp3pv23OcyIVWPg6BKd48rb/uq+QqcsDwTXwqTUOlAfhZhyIwn
CVBDmqpuQL5BJPopvAzVFP/UKZZ0ChE7kuhAPFIOkCO6RVKpKE+1Zvqgb3QXUU4q
5U7U8hrmwPBRSEhAmTYApzDAx7rqSKIWTm5k82Nm1WfzgyqNb+NubwOwkyRr0u7Y
RobfXOEjbUCV5F6IejMN/pnufJs6CDPRTlz09roZ32kn5u+ibJyV0Nsa9L1sIwFm
yJESD3B8y1BA2NCllBwu6semP74zJ5h90Kp4/xvLX/poS+VcY3Owfs7GeO8bDijl
IwV+qD3RYSlGJmxq2ILPa/fuxxMbIsXLudNeZAtC1zmO28x6aUwYvpyDdgvEEu+P
G9k1PiUNR9g/gbTv78dAmw62CrEQoss84ESlY5A+pbjAgQh0bLg=
=74Sg
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
