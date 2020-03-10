Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603B617F50F
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Mar 2020 11:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgCJK3h (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Mar 2020 06:29:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40491 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgCJK3h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Mar 2020 06:29:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id p2so14309731wrw.7;
        Tue, 10 Mar 2020 03:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qGwZboIs0ZR/99AVR6R31K0DUSqZme+rnI0Wnc0nMko=;
        b=npSwRELyom6CLzjrnMsFowiFOSJudp0JQxFGnHmb07lFIvUN56/yoK8JFtO6LAPjO/
         q09BRbJkgfIlGTfFS5PhSQ/zmZ2zN85WiHWSzBJj1Qm317MsmBm/+4tawabQl4asrvKI
         1Verw7KUlbxjuX+hXVlXkcVvw+fCIaP6V0sihyFiaajaU8AHggprpjozFkCSSqmCG+Zy
         qDtyLvcgTw9xDLd3O4UQSjxr5WVK9njOfIWy2rXsEjVU/YKSnHlSo5Wu8zCGGIoL30i0
         54TNVPXASVQsmkt8D7O58c6un0JMu65pMw1stnhsf0Tq+I3KkEs6mKS4VdOypSFILho7
         QoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qGwZboIs0ZR/99AVR6R31K0DUSqZme+rnI0Wnc0nMko=;
        b=X20MJvPFLfvLfZD+rkvjMNzIq4PR9TdvGwRaPdYDwgsC89AnvDPJI2j2+VweU1bDXN
         OuLy2sUkKyKCcsG5L9R514KXiz5xNHjZ+v4eEyvINk0ePmE1qNgyGegpTLGm0k1OpgJE
         raiSEz5jOiufR3kUM2MV3jtHAFTjkdKqQjvMEZcB8lxtvdsySqpOkrr+7reH1zcXHx5B
         xGAMK+r9+ygguisELGp23e5AgWzZoa3u9cVYAi+LWQiMv6eL4epkNXXQvd8p8kKULL5d
         W/LdKQoU4dyEKr/pHKG9RBnqyJRMw6kzyQLvr7OV6XShJuShnx3eD6DikHMUUZw2CNPW
         gifA==
X-Gm-Message-State: ANhLgQ3BmfsXK2rXLgLNHV3BPYLet/nvO1CjTtPGapTXNEkE27mYaB9R
        JPFReGcKeYoLUDoj0O+2Otp+3E3z
X-Google-Smtp-Source: ADFU+vtcJJaZw7lEEdZYMLUBC24CEKRajvuTPvK66sHbl93On5Hg/cRBy3IvQMHuQgAF8UxC1V4j0w==
X-Received: by 2002:adf:ba48:: with SMTP id t8mr25912559wrg.329.1583836174526;
        Tue, 10 Mar 2020 03:29:34 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id 133sm3767491wmd.5.2020.03.10.03.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 03:29:33 -0700 (PDT)
Date:   Tue, 10 Mar 2020 11:29:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
Message-ID: <20200310102931.GA2030107@ulmo>
References: <20200305175138.92075-1-thierry.reding@gmail.com>
 <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2020 at 06:48:47PM -0700, Stephen Boyd wrote:
> Quoting Thierry Reding (2020-03-05 09:51:38)
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > As part of the clock frequency change sequence, a driver may need to
> > reparent a clock. In that case, the rate will already have been updated
> > and the cached parent rate will no longer be valid, so just skip the
> > recalculation.
>=20
> Can you describe more about what's going on and why this needs to
> change? For example, we have 'set_rate_and_parent' for cases where a
> driver reparents a clk during a rate change. Is that not sufficient
> here?

By "driver" above, I mean clock driver. One example where we need this,
and currently work around it, is the Tegra124 EMC (external memory
controller) clock driver. You can find this here:

	drivers/clk/clk-emc.c

If you look at the emc_recalc_rate() function, it needs to override the
parent clock rate because CCF calls it with the clock rate of the parent
prior to the rate change, whereas the parent (and/or the rate)
potentially change during the rate change.

The reason why we can't use ->set_rate_and_parent() here is because the
consumers never actually change the parent for the EMC clock. Instead it
is up to the EMC driver to select the parent based on the specific rate
that is requested. The parent clock is encoded in a table of supported
EMC frequencies that a particular board can support. This table is
passed to the EMC driver from the firmware or hardcoded in DT, depending
on the particular SoC generation.

For a bit more background: the use-case is to accumulate a set of
bandwidth requests within the EMC driver, which can then be converted
into a clock frequency that is required for the EMC to provide that
bandwidth. Since the controls for this are sprinkled around a bit, the
nicest way to represent this is using an "emc" clock (in the clock and
reset controller) and the EMC driver that deals with programming the EMC
(which has registers separate from the clock and reset controller).

So basically how this works is that the "emc" clock driver needs to call
back into the EMC driver to perform the clock change. This being a clock
that is needed to operate system memory, we have to be very careful when
things happen. So a frequency switch typically requires the old parent
to remain enabled while the EMC is programmed with new settings and then
switched to the new parent. Only then can the old parent be disabled.
The parent change happens fairly deep inside the EMC sequence and can't
be isolated from that, unfortunately.

In order to deal with that, we basically "fixup" the clock tree after
the frequency change by calling clk_hw_reparent() manually. This in turn
causes the parent to change, but clk_set_rate() doesn't know about that.
Instead, it has the parent rate cached in a local variable, which will
no longer be the correct value after the switch has happened.

Fortunately, clk_hw_reparent() already causes the rates of the entire
subtree of clocks to be recalculated, so there isn't anything left to do
when we return from the rate change. This patch detects when this has
happened by checking that the current parent against the "cached" parent
that the cached parent rate is based on. If they aren't equal, it
assumes that the clock driver has manually reparented the clock and does
not have to do anything else.

Does that clarify things?

Thierry

> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clk/clk.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index ebfc1e2103cb..49d92f4785a2 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2079,7 +2079,14 @@ static void clk_change_rate(struct clk_core *cor=
e)
> > =20
> >         trace_clk_set_rate_complete(core, core->new_rate);
> > =20
> > -       core->rate =3D clk_recalc(core, best_parent_rate);
> > +       /*
> > +        * Some drivers need to change the parent of a clock as part of=
 the
> > +        * rate change sequence. In that case, best_parent_rate is no l=
onger
> > +        * valid. However, reparenting already recalculates the rate fo=
r the
> > +        * entire clock subtree, so we can safely skip this here.
> > +        */
> > +       if (core->parent =3D=3D parent)
> > +               core->rate =3D clk_recalc(core, best_parent_rate);
> > =20
>=20
> I wonder if we can undo the recursion and figure out a way to make this
> only happen once, when we want it to happen.

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nbAgACgkQ3SOs138+
s6HYyQ//bMNNX+YBUFM/54+78JTbeEG/dT7QOs/zEfSH28K5HAKKItmUsgS43WlZ
yP/K3m0JBonknP4u7oU7iycBG9ekpnb/T6Bw9D9in0sUMPBy/B9dPG4chhhQ/2MJ
CyOPnaFsQxj/dNvLsWydLd7Gd9JW4qSXXC8QVmP6F+vWFEOp3cOjiZdbEV15IaYM
EBS6Qw1ZrLZvv68w2XJG097lipj4GkJwLsu+HRCR5PM6EbJPyrdxWSMCiwidH6fi
uorYqLyeSjGddWaWOnCzwVS6SZQmJQiGrJfnc4KDQ97EbGHQlBdMnGwsjlFvTK8u
SqKuWIdyk43KUf/RGckzaa8ffVTWRnO/wGF+55VcdmsRhcOW06DQhrAWZnjMkbif
O7oDK4IOB9NFGDpnYGdzvvRk1nz/HJ4P7B7jjB6tb8vltmLmSo9h4SMOATW272LZ
vgUUlLUfnR/XYeRBUrVaNYqmKXwOQGjFlclET9lrn2bpJz+jh4Q54XPQ1RJQ0uQe
+u8V7uNgWQ7tcpmhviz52HrCGa3N9fBihw7oXn+WXKVrMn3Rp3kKqff7TwGt1OGj
gRleNftXtk71HFbDjNrKHmSMcJTr5oe3E4wgxaLgtSqfHUBWvoBhPjZsnCEevbWu
61QJaoTIPNJ0SvoNYwuXRLTmuzGsSyaQxvMGjhZoX+/ne5idjoE=
=B3W7
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
