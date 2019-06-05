Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6237F3585D
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 10:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbfFEIRD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 04:17:03 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38338 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfFEIRD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 04:17:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id d18so18461947wrs.5
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 01:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jHrQ2ViHC6ifLalAaSSqgrKue9yDQo29kYzFlYumPcs=;
        b=j6vpjuKnpyo21ngEULtEY5xsZfMvu4tT2SbyqZa3H4cX4xjiACNfpU9oEoTS31j3XE
         Tuk9pkrd+QmBMMxjR/GNYeRBN2Gh1HlwkWxtK3qIKeBFp5oCQcIYbSN1njntViL8DSs0
         LZTnNXPJ1ido7zp6UWhjKYq0wJggbRxhm1sPsN8VHdyk4Yz/QXkAUtwH8dLxD6dbXKTR
         Ao0xnzhJ14TfN8JfQrwpSX1uAAUtElE6dkO69X8TxW7C1SoQhKVYB0iuC3zcMJW28PLO
         9vVQ7PFUBLNQ9O+mODkib7bupxPYmB7ccgtW9ELwvmXszO89Q9PvvEm/+s+uaWlwRDo2
         obsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jHrQ2ViHC6ifLalAaSSqgrKue9yDQo29kYzFlYumPcs=;
        b=oxj4MJ0Z6Rj5/78AOuGtNgvCjZ1gzGRqlSNIbmKSnh8zYizeG0kBKx/VTTUyfTWnqp
         Npn4FcRp25lq4BJaGHv76pFUfv4khdzjB4NipgBcOA6pHhl5/4O08PaTFa7jSt4ZwXAH
         PbpmrZGe0qt7etSaiviJqOWbUH+y4xfEN6JUDysoKFBfgW4rsuOXdR/Y6LxUXHdmUWOS
         1T6Q9Jq3pSgZLG9vyXHiObGHT/oA7eagTGKHXRvXljFgmND8rjlRV5MCytHvRqu2xjAl
         ALGWqpNY7G47KMKR8nFbHeXYwlnZK6tco/O1n/7FN6d6CDO90iR+s9ZIzA8hd9na/iaC
         ZDYg==
X-Gm-Message-State: APjAAAUX0lXTiWu5vS5J/EGa6+qQQ436w9pznkPOzbhNWv/uvdUa/LZU
        6lQuzoSHUdg9kltes67n9NU=
X-Google-Smtp-Source: APXvYqxdtYU0TN4tcHBGe/ALeaQPGkNBSVE8fkGRnZRjA2BpzcDNSYlFnLXVgs8/xEqgmVVL7JUNhQ==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr23024876wrt.111.1559722621712;
        Wed, 05 Jun 2019 01:17:01 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id h84sm7348943wmf.43.2019.06.05.01.17.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 01:17:00 -0700 (PDT)
Date:   Wed, 5 Jun 2019 10:16:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH V2] arm64: tegra: add CPU cache topology for Tegra186
Message-ID: <20190605081659.GA10944@ulmo>
References: <20190605022640.17837-1-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20190605022640.17837-1-josephl@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 10:26:40AM +0800, Joseph Lo wrote:
> Tegra186 has two CPU clusters with its own cache hierarchy. This patch
> adds them with the cache information of each of the CPUs.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v2:
>  - add detail cache information
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)

Applied, thanks.

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3enYACgkQ3SOs138+
s6Ft9g//YhdzpDxT8SmLLJxJ+RqnMTzqOtGr5Gn6zGrVsJqu9rOnscmSY3aYVqoj
Tsp+6ZEQp2IqmzxfCKF3Dmbnd7d3tgnUI2iAb3DyF24e4TGJH76ivK9hnVaxNteX
3vGtfKjalTkw1cbGFGi7KeRc3Rkmz7GIJtw7T8b75NQ20bT8XKBO2znIs48GRFoE
vnlCsEt4JAzH9EgQpllYZzO9re69JnVCUNS6TXJ6DLGkyR7h1lAWgKXW4bKo0PMN
vV/Dr51VPRLc5j6177mWh8sUryxiYmDnNsdqhNpXpLXSVUjZuSoW724bdsSPK7oq
p0YzmjxiMUG+inBgeneypDt9Uic3ozJnUoWnm/JiiDYxgfb6yq3SZ+A9mq945lvg
2iLK/Axg8y3hhCuiGNqYeJFPyHh6OQoMTMqyP3PY08ngW86NcYlrx22zTRKDqPR9
5MlRPsv0ewj94M0PR8yvShupwl8irJ9RfLr1zWCbWvV8EHFO7zFKHBOOYHAXew6x
x+Rkp5Qj1eQEwE5oNTTasePntVFfMVB+bSTfTDTYEyV6xXA96DvwNrGL5tW10mYl
Xf+5g6MAtN+CKCDKvJaK9GM6s0ybmgH7v8QY3ZxNiNHKpo5fjLib6CbxPCxvLjjL
LA0QHleueeSZHC1PHURdXU3L//y9GrykEDP1BCkhXt3nzf2yJQk=
=yybJ
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
