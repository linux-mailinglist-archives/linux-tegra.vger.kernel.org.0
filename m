Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6EC018B99A
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2020 15:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbgCSOlk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Mar 2020 10:41:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50955 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgCSOlj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Mar 2020 10:41:39 -0400
Received: by mail-wm1-f66.google.com with SMTP id z13so2724955wml.0
        for <linux-tegra@vger.kernel.org>; Thu, 19 Mar 2020 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UnzFvog/ZZHuYATA7oC6JDKAefk/FCpxOezZvEwjAdU=;
        b=tu4TuftGlwZKz+Qtl4lhdHpEuOO6VhSRIq2xiOD8bw6cQqbxgiv13q1PY//tDgnjcA
         F1LhfGl4MwLkfc5wrwa4LL1BFpDjHA7PLco//1x28cpRWV+l2kip8mgiMYaxSoC0nLFU
         +NAfU97ch+GQCldaY1+wcFSciIz/rJhBkhkOBYLyNypmET3/a5paT2jFOTT8jzWqmX7w
         7wIVi7QZFAGmz5zj+/mtYW7ajs9k6MsPk/RIhC3r3AN9EMLv2Itcw503vJ2JFJCrPX/e
         OVUCMVCDl8dAL/Oqz7hxrRCOTy/7eq5xxnUPr78IjBTlwaDNy2UTVhtYAPt71tkvkQnY
         ELbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UnzFvog/ZZHuYATA7oC6JDKAefk/FCpxOezZvEwjAdU=;
        b=cZgmddoOahrKGBAH919yo4PpWYKX0DQQ98jBi7+RpX+lMY2lMX0kPC8HtpoQfdT+OQ
         wPCfB7vqjdsrYT4E76OEY4k8jds5NL7iDMkKh2ysU+rtXCHRxZSzbp3i57tc2Jm89SHs
         1YIhCZMUV30RaSWxUsUCz5+d8kObQcIkCUASGw7L9kygHXrvsZgmjuTtITemM4Iw0uD5
         OwBD0s/tPSSp5ijgbIUXIg6kRxAQ6sMrGf1ApZ3uzhDhkJ+f3r55W/tsrhls8rresjSI
         nCUM2/zYq08jjP87S8ZkhGjxY2FeeL3uYA6pph93QPZDAuXPFRQZv4FYnKaW0GP78J6Y
         vgjw==
X-Gm-Message-State: ANhLgQ1JQfs/Ds8/oPP4CcOdFWTrgNg3ZfPzTvT5ttG9noUI4pq0vhI6
        1j5uM2aU8hwmG9r7KPFcpT9Dhy9u
X-Google-Smtp-Source: ADFU+vvygh4kwm3N8tRWNNbFM700F+qp0H9Eyg7Gm0xuYPyb6QNswXk1TsnIOXUj53YSuNIwwVVdXQ==
X-Received: by 2002:a7b:c082:: with SMTP id r2mr4375609wmh.177.1584628897613;
        Thu, 19 Mar 2020 07:41:37 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id s1sm3787541wrp.41.2020.03.19.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 07:41:36 -0700 (PDT)
Date:   Thu, 19 Mar 2020 15:41:35 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 10/10] phy: tegra: Changes for v5.7-rc1
Message-ID: <20200319144135.GA3266151@ulmo>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
 <20200313165848.2915133-10-thierry.reding@gmail.com>
 <20200316134850.GB3825456@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20200316134850.GB3825456@ulmo>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 02:48:50PM +0100, Thierry Reding wrote:
> On Fri, Mar 13, 2020 at 05:58:48PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea098=
62b9:
> >=20
> >   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-5.7-phy
> >=20
> > for you to fetch changes up to 04c929223d1db6ad4ba8e4c23122e1052f670c2e:
> >=20
> >   phy: tegra: xusb: Don't warn on probe defer (2020-03-13 09:17:50 +010=
0)
> >=20
> > This is a dependency for the USB changes that are also part of this
> > series of pull requests, so it was deemed easier to take this all
> > through the ARM SoC tree. The patches have all been acked by Kishon.
>=20
> Please don't merge this just yet. Stephen reported today that this was
> breaking the build in linux-next because of a conflict with the USB
> tree. I'll rebase this on top of Greg's usb-next branch and resend the
> pull request.
>=20
> Sorry for the inconvenience.

I've pushed an updated version of this as tegra-for-5.7-phy-v2. However,
it's also included as a dependency in a USB branch for which I've sent a
PR to Greg, so I don't think you'll need to merge this after all.

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5zhJ8ACgkQ3SOs138+
s6GhORAAjNlN+ZLW5SU5O91T0zeQguAXCuV2DegEYBPX2Bi4ASL1voQ77Yx1LQ7j
xIlWW9JPRfeKw8jwS9gF3VihEoTEnFe4S5XzM/Ozsn5h3v2gO+TPu/dvswa0X3AV
H/Wq5YWGMLnKDJVGi1T7rnfRHgIfw5iMwhE+0cEdCwVhPFqcfJbToF9Fi9ff33qp
y6sE2mbv/RuME62u+vNoNo9oJMva0sXo5FyJOzRD3yd2YkvCOmeVJsqlhPeJt5qH
cslbI+ExBZhTZGnGbePA8AqzRZxXEq/c4ddwN4cnW5BEpzCD8o9hfngQW2A20EpH
kzOpgZheF3SnHqOpmvMiola/5cAd6mXgVdgFkWnwDnBgPqYk9mttnL+IOLwSJCsA
W8hu2bZkw8bnstp5X7UaBZY3G8QaWToyhl+JDMD4LZcxyybQflhYIoFoFtoyWPeE
74CLBAU+VfKl/HNQqvbWsNAMss76ldwP1HKXtau552hpYY51mQrZlahUaKRMTrM1
YXNKSgbjBr7YleiMa621DKgxda7Kq/qTBYLevK6V4QBXTvLrZAH7giCOrg0P/qpW
5Cx2SOuKCaLLYz6mCOXJK1voyeIraOlvuDRClE4VpZAbOY5cqDemCBob/+L3Y6NU
xuh+YKkPNi3fel3tAMyjvsJLzYaGFev5z5Sr4jA50+HejLHZtiY=
=GYTf
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
